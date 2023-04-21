// Import the functions you need from the SDKs you need
const { initializeApp } = require("firebase/app");
const { getAnalytics } = require("firebase/analytics");
const { getStorage } = require("firebase/storage");
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyAejI_3EZ1jvPE7g_ZrtGVFRabSGMwLMZ0",
  authDomain: "livegoods-78a2f.firebaseapp.com",
  databaseURL: "https://livegoods-78a2f-default-rtdb.firebaseio.com",
  projectId: "livegoods-78a2f",
  storageBucket: "livegoods-78a2f.appspot.com",
  messagingSenderId: "198172025334",
  appId: "1:198172025334:web:8fbeb677fca4d931f967d7",
  measurementId: "G-CSLSNV0N8W",
};

// const firebaseConfig = {
//   apiKey: process.env.FIREBASE_APIKEY,
//   authDomain: process.env.FIREBASE_AUTHDOMAIN,
//   databaseURL: process.env.FIREBASE_DATABASEURL,
//   projectId: process.env.FIREBASE_PROJECTID,
//   storageBucket: process.env.FIREBASE_STORAGEBUCKET,
//   messagingSenderId: process.env.FIREBASE_MESSAGINGSENDERID,
//   appId: process.env.FIREBASE_APPID,
//   measurementId: process.env.FIREBASE_MEASUREMENTID,
// };

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const defaultStorage = getStorage(app);

module.exports = {
  app,
  defaultStorage,
};
