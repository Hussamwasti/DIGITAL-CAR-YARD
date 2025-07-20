importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-storage.js");

firebase.initializeApp({
    apiKey: 'AIzaSyDang2SHfeC2DAF2-QTDat51p0UHQ_e-H8',
    appId: '1:820535541122:web:4e96527bdad33ba72d239b',
    messagingSenderId: '820535541122',
    projectId: 'digitalcardyard',
    authDomain: 'digitalcardyard.firebaseapp.com',
    storageBucket: 'digitalcardyard.appspot.com',
});


const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});