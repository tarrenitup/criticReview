db = db.getSiblingDB("users");

db.createUser({
  user: "api",
  pwd: "password",
  roles: [ { role: "readWrite", db: "users" } ]
});

db.users.insertOne({
    userID: "testuser", 
    password: "hunter2",
    name: "James",
    age: "21",
    email: "barryj@oregonstate.edu"
})