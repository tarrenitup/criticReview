const router = require('express').Router();
const validation = require('../lib/validation');
const { getReviewsByGameID } = require('./UserReview');

/*
 * Schema describing required/optional fields of a game object.
 */
const gamesSchema = {
  gameID: { required: true },
  gameName: { required: true },
  esrb: { required: true },
  description: { required: true },
  overallCriticScore: { required: true },
  overallUserScore: { required: true }
};

/*
 * Executes a MySQL query to fetch the total number of games.  Returns
 * a Promise that resolves to this count.
 */
function getGamesCount(mysqlPool) {
  return new Promise((resolve, reject) => {
    mysqlPool.query('SELECT COUNT(*) AS count FROM Games', function (err, results) {
      if (err) {
        reject(err);
      } else {
        resolve(results[0].count);
      }
    });
  });
}

/*
 * Executes a MySQL query to return a single page of games.  Returns a
 * Promise that resolves to an array containing the fetched page of games.
 */
function getGamesPage(page, totalCount, mysqlPool) {
  return new Promise((resolve, reject) => {
    /*
     * Compute last page number and make sure page is within allowed bounds.
     * Compute offset into collection.
     */
    const numPerPage = 10;
    const lastPage = Math.max(Math.ceil(totalCount / numPerPage), 1);
    page = page < 1 ? 1 : page;
    page = page > lastPage ? lastPage : page;
    const offset = (page - 1) * numPerPage;

    mysqlPool.query(
      'SELECT * FROM Games ORDER BY id LIMIT ?,?',
      [ offset, numPerPage ],
      function (err, results) {
        if (err) {
          reject(err);
        } else {
          resolve({
            games: results,
            pageNumber: page,
            totalPages: lastPage,
            pageSize: numPerPage,
            totalCount: totalCount
          });
        }
      }
    );
  });
}

/*
 * Route to return a paginated list of games.
 */
router.get('/', function (req, res) {
  const mysqlPool = req.app.locals.mysqlPool;
  getGamesCount(mysqlPool)
    .then((count) => {
      return getGamesPage(parseInt(req.query.page) || 1, count, mysqlPool);
    })
    .then((gamesPageInfo) => {
      /*
       * Generate HATEOAS links for surrounding pages and then send response.
       */
      gamesPageInfo.links = {};
      let { links, pageNumber, totalPages } = gamesPageInfo;
      if (pageNumber < totalPages) {
        links.nextPage = `/games?page=${pageNumber + 1}`;
        links.lastPage = `/games?page=${totalPages}`;
      }
      if (pageNumber > 1) {
        links.prevPage = `/games?page=${pageNumber - 1}`;
        links.firstPage = '/games?page=1';
      }
      res.status(200).json(gamesPageInfo);
    })
    .catch((err) => {
      console.log(err);
      res.status(500).json({
        error: "Error fetching games list.  Please try again later."
      });
    });
});

/*
 * Executes a MySQL query to insert a new game into the database.  Returns
 * a Promise that resolves to the ID of the newly-created game entry.
 */
function insertNewGame(game, mysqlPool) {
  return new Promise((resolve, reject) => {
    game = validation.extractValidFields(game, gameSchema);
    game.gameID = null;
    mysqlPool.query(
      'INSERT INTO Games SET ?',
      game,
      function (err, result) {
        if (err) {
          reject(err);
        } else {
          resolve(result.insertId);
        }
      }
    );
  });
}

/*
 * Route to create a new game.
 */
router.post('/', function (req, res, next) {
  const mysqlPool = req.app.locals.mysqlPool;
  if (validation.validateAgainstSchema(req.body, gameSchema)) {
    insertNewGame(req.body, mysqlPool)
      .then((id) => {
        res.status(201).json({
          id: id,
          links: {
            game: `/games/${id}`
          }
        });
      })
      .catch((err) => {
        res.status(500).json({
          error: err
        });
      });
  } else {
    res.status(400).json({
      error: "Request body is not a valid game object."
    });
  }
});

/*
 * Executes a MySQL query to fetch information about a single specified
 * game based on its ID.  Returns a Promise that resolves to an object
 * containing information about the requested game.  If no game with
 * the specified ID exists, the returned Promise will resolve to null.
 */
function getGameByID(gameID, mysqlPool) {
  /*
   * Execute three sequential queries to get all of the info about the
   * specified game, including all its reviews.  If the original
   * request to fetch the game doesn't match a game, send null through
   * the promise chain.
   */
  let returnGame = {};
  return new Promise((resolve, reject) => {
    mysqlPool.query('SELECT * FROM Games WHERE gameID = ?', [ gameID ], function (err, results) {
      if (err) {
        reject(err);
      } else {
        resolve(results[0]);
      }
    });
  });/*).then((business) => {
    if (business) {
      returnBusiness = business;
      return getReviewsByBusinessID(businessID, mysqlPool);
    } else {
      return Promise.resolve(null);
    }
  }).then((reviews) => {
    if (reviews) {
      returnBusiness.reviews = reviews;
      return getPhotosByBusinessID(businessID, mysqlPool);
    } else {
      return Promise.resolve(null);
    }
  }).then((photos) => {
    if (photos) {
      returnBusiness.photos = photos;
      return Promise.resolve(returnBusiness);
    } else {
      return Promise.resolve(null);
    }
  })*/
}

/*
 * Route to fetch info about a specific game.
 */
router.get('/:gameID', function (req, res, next) {
  const mysqlPool = req.app.locals.mysqlPool;
  const gameID = parseInt(req.params.gameID);
  getGameByID(gameID, mysqlPool)
    .then((game) => {
      if (game) {
        res.status(200).json(game);
      } else {
        next();
      }
    })
    .catch((err) => {
      res.status(500).json({
        error: "Unable to fetch game.  Please try again later."
      });
    });
});

/*
 * Executes a MySQL query to replace a specified game with new data.
 * Returns a Promise that resolves to true if the game specified by
 * `gameID` existed and was successfully updated or to false otherwise.
 */
function replaceGameByID(gameID, game, mysqlPool) {
  return new Promise((resolve, reject) => {
    game = validation.extractValidFields(game, gameSchema);
    mysqlPool.query('UPDATE Games SET ? WHERE gameID = ?', [ game, gameID ], function (err, result) {
      if (err) {
        reject(err);
      } else {
        resolve(result.affectedRows > 0);
      }
    });
  });
}

/*
 * Route to replace data for a game.
 */
router.put('/:gameID', function (req, res, next) {
  const mysqlPool = req.app.locals.mysqlPool;
  const gameID = parseInt(req.params.gameID);
  if (validation.validateAgainstSchema(req.body, gameSchema)) {
    replaceGameByID(gameID, req.body, mysqlPool)
      .then((updateSuccessful) => {
        if (updateSuccessful) {
          res.status(200).json({
            links: {
              game: `/games/${gameID}`
            }
          });
        } else {
          next();
        }
      })
      .catch((err) => {
        console.log(err);
        res.status(500).json({
          error: "Unable to update specified game.  Please try again later."
        });
      });
  } else {
    res.status(400).json({
      error: "Request body is not a valid game object"
    });
  }
});

/*
 * Executes a MySQL query to delete a game specified by its ID.  Returns
 * a Promise that resolves to true if the game specified by `gameID`
 * existed and was successfully deleted or to false otherwise.
 */
function deleteGameByID(gameID, mysqlPool) {
  return new Promise((resolve, reject) => {
    mysqlPool.query('DELETE FROM Games WHERE gameID = ?', [ gameID ], function (err, result) {
      if (err) {
        reject(err);
      } else {
        resolve(result.affectedRows > 0);
      }
    });
  });

}

/*
 * Route to delete a game.
 */
router.delete('/:gameID', function (req, res, next) {
  const mysqlPool = req.app.locals.mysqlPool;
  const gameID = parseInt(req.params.gameID);
  deleteGameByID(gameID, mysqlPool)
    .then((deleteSuccessful) => {
      if (deleteSuccessful) {
        res.status(204).end();
      } else {
        next();
      }
    })
    .catch((err) => {
      res.status(500).json({
        error: "Unable to delete game.  Please try again later."
      });
    });
});

/*
 * Executes a MySQL query to fetch all games owned by a specified user,
 * based on on the user's ID.  Returns a Promise that resolves to an array
 * containing the requested games.  This array could be empty if the
 * specified user does not own any games.  This function does not verify
 * that the specified user ID corresponds to a valid user.
 *
function getBusinessesByOwnerID(userID, mysqlPool) {
  return new Promise((resolve, reject) => {
    mysqlPool.query(
      'SELECT * FROM businesses WHERE ownerid = ?',
      [ userID ],
      function (err, results) {
        if (err) {
          reject(err);
        } else {
          resolve(results);
        }
      }
    );
  });
}*/

exports.router = router;
//exports.getBusinessesByOwnerID = getBusinessesByOwnerID;