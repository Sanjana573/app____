const functions = require("firebase-functions");
const admin = require("firebase-admin");
const nodemailer = require("nodemailer");

admin.initializeApp();

const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: "sanjanahebbar10@gmail.com",
    pass: "catlover.2507",
  },
});

exports.sendPaymentConfirmation = functions.firestore
    .document("payments/{paymentId}")
    .onCreate(async (snapshot, context) => {
      const paymentData = snapshot.data();
      const userEmail = paymentData.email;
      const mailOptions = {
        from: "your-email@gmail.com",
        to: userEmail,
        subject: "Payment Confirmation",
        text: "Your payment has been confirmed. Thank you for your purchase!",
      };

      try {
        await transporter.sendMail(mailOptions);
        console.log("Email sent successfully");
      } catch (error) {
        console.error("Error sending email:", error);
      }

      return null;
    });
