const router = module.exports = require('express').Router();

router.use('/games', require('./games').router);
router.use('/users', require('./users').router);
router.use('/criticReview', require('./criticReview').router);
router.use('/UserReview', require('./UserReview').router);