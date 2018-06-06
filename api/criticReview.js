const router = require('express').Router();
const validation = require('../lib/validation');


const criticReviewSchema = {
    reviewID: { required: true },
    url: { required: true },
    gameID: { required: true },
    websiteName: { required: true },
    authorName: { required: true },
    score: { required: true },
    reviewContent: { required: true },
    datePosted: { required: true },
};



/*
 * Executes a MySQL query to insert a new critic review into the database.  Returns
 * a Promise that resolves to the ID of the newly-created critic review entry.
 */
function insertNewCriticReview(review, mysqlPool) {
  return new Promise((resolve, reject) => {
    review = validation.extractValidFields(review, criticReviewSchema);
    review.id = null;
    mysqlPool.query(
      'INSERT INTO CriticReview SET ?',
      review,
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
 * Route to create a new critic review.
 */
router.post('/', function (req, res, next) {
  const mysqlPool = req.app.locals.mysqlPool;
  if (validation.validateAgainstSchema(req.body, criticReviewSchema)) {
      insertNewCriticReview(review, mysqlPool)
      .then((id) => {
        res.status(201).json({
          id: id,
          links: {
            review: `/criticReview/${id}`,
            game: `/games/${req.body.gameID}`
          }
        });
      })
      .catch((err) => {
        res.status(500).json({
        error: "Error inserting critic review into DB."
        });
      });
  } else {
    res.status(400).json({
      error: "Request body is not a valid critic review object."
    });
  }
});

/*
 * Executes a MySQL query to fetch a single specified critic review based on its ID.
 * Returns a Promise that resolves to an object containing the requested critic
 * review.  If no critic review with the specified ID exists, the returned Promise
 * will resolve to null.
 */
function getCriticReviewByID(reviewID, mysqlPool) {
  return new Promise((resolve, reject) => {
    mysqlPool.query('SELECT * FROM CriticReview WHERE id = ?', [ reviewID ], function (err, results) {
      if (err) {
        reject(err);
      } else {
        resolve(results[0]);
      }
    });
  });
}

/*
 * Route to fetch info about a specific review.
 */
router.get('/:reviewID', function (req, res, next) {
  const mysqlPool = req.app.locals.mysqlPool;
  const reviewID = parseInt(req.params.reviewID);
  getCriticReviewByID(reviewID, mysqlPool)
    .then((review) => {
      if (review) {
        res.status(200).json(review);
      } else {
        next();
      }
    })
    .catch((err) => {
      res.status(500).json({
        error: "Unable to fetch critic review."
      });
    });
});

/*
 * Executes a MySQL query to replace a specified critic review with new data.
 * Returns a Promise that resolves to true if the critic review specified by
 * `reviewID` existed and was successfully updated or to false otherwise.
 */
function replaceCriticReviewByID(reviewID, review, mysqlPool) {
  return new Promise((resolve, reject) => {
    review = validation.extractValidFields(review, criticReviewSchema);
    mysqlPool.query('UPDATE CriticReview SET ? WHERE id = ?', [ review, reviewID ], function (err, result) {
      if (err) {
        reject(err);
      } else {
        resolve(result.affectedRows > 0);
      }
    });
  });
}

/*
 * Route to update a review.
 */
router.put('/:reviewID', function (req, res, next) {
  const mysqlPool = req.app.locals.mysqlPool;
  const reviewID = parseInt(req.params.reviewID);
  if (validation.validateAgainstSchema(req.body, criticReviewSchema)) {
    let updatedReview = validation.extractValidFields(req.body, criticReviewSchema);
    /*
     * Make sure the updated critic review has the same gameID as
     * the existing review.  If it doesn't, respond with a 403 error.  If the
     * review doesn't already exist, respond with a 404 error.
     */
    getCriticReviewByID(reviewID, mysqlPool)
      .then((existingReview) => {
        if (existingReview) {
          if (updatedReview.gameID === existingReview.gameID) {
            return replaceCriticReviewByID(reviewID, updatedReview, mysqlPool);
          } else {
            return Promise.reject(403);
          }
        } else {
          next();
        }
      })
      .then((updateSuccessful) => {
        if (updateSuccessful) {
          res.status(200).json({
            links: {
              business: `/games/${updatedReview.gameID}`,
              review: `/criticReview/${reviewID}`
            }
          });
        } else {
          next();
        }
      })
      .catch((err) => {
        if (err === 403) {
          res.status(403).json({
            error: "Updated review must have the same gameID"
          });
        } else {
          res.status(500).json({
            error: "Unable to update review."
          });
        }
      });
  } else {
    res.status(400).json({
      error: "Request body is not a valid review object."
    });
  }
});

/*
 * Executes a MySQL query to delete a critic review specified by its ID.  Returns
 * a Promise that resolves to true if the critic review specified by `reviewID`
 * existed and was successfully deleted or to false otherwise.
 */
function deleteReviewByID(reviewID, mysqlPool) {
  return new Promise((resolve, reject) => {
    mysqlPool.query('DELETE FROM CriticReview WHERE id = ?', [ reviewID ], function (err, result) {
      if (err) {
        reject(err);
      } else {
        resolve(result.affectedRows > 0);
      }
    });
  });

}

/*
 * Route to delete a review.
 */
router.delete('/:reviewID', function (req, res, next) {
  const mysqlPool = req.app.locals.mysqlPool;
  const reviewID = parseInt(req.params.reviewID);
  deleteReviewByID(reviewID, mysqlPool)
    .then((deleteSuccessful) => {
      if (deleteSuccessful) {
        res.status(204).end();
      } else {
        next();
      }
    })
    .catch((err) => {
      res.status(500).json({
        error: "Unable to delete review.  Please try again later."
      });
    });
});

/*
 * Executes a MySQL query to fetch all reviews for a game, based
 * on the game's ID. Returns a Promise that resolves to an array
 * containing the requested critic reviews. This array could be empty if the
 * specified game does not have any critic reviews.  This function does not verify
 * that the specified game ID corresponds to a valid game.
 */
function getReviewsByGameID(gameID, mysqlPool) {
  return new Promise((resolve, reject) => {
    mysqlPool.query(
      'SELECT * FROM CriticReview WHERE gameID = ?',
      [ gameID ],
      function (err, results) {
        if (err) {
          reject(err);
        } else {
          resolve(results);
        }
      }
    );
  });
}

/*
 * Executes a MySQL query to fetch all critic reviews by a specified critic, based on
 * on the author name. Returns a Promise that resolves to an array containing
 * the requested reviews. This array could be empty if the specified author
 * does not have any reviews. This function does not verify that the specified
 * authorName corresponds to a valid critic.
 */
function getReviewsByCritic(authorName, mysqlPool) {
  return new Promise((resolve, reject) => {
    mysqlPool.query(
      'SELECT * FROM CriticReview WHERE authorName = ?',
      [ authorName ],
      function (err, results) {
        if (err) {
          reject(err);
        } else {
          resolve(results);
        }
      }
    );
  });
}

exports.router = router;
exports.getReviewsByGameID = getReviewsByGameID;
exports.getReviewsByCritic = getReviewsByCritic;
