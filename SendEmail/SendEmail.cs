using Amazon;
using System;
using System.Collections.Generic;
using Amazon.SimpleEmail;
using Amazon.SimpleEmail.Model;
using System.Text;
using System.IO;

namespace SendEmail
{
    public class SendEmail
    {
        static readonly string senderAddress = "sahab5278@gmail.com";
        public static void Registration(string customerName, string receiverAddress, string customerID)
        {
            string subject = "Registration Successful";
            string htmlBody = @"<html>
<head></head>
<body>
  <h1>Welcome to Hotel Reservation System</h1>
  <p>Thanks for choosing our service</p>
  <p>Your Registration is successful.</p>
</body>
</html>" + "Your customer ID is " + customerID + "\n" + @"<html>
<head></head>
<body>
  <p>Now Book hotel at affordable price.</p>
</body>
</html>";
            string textBody = "Welcome\r" + customerName;
            ExecuteSendEmail(receiverAddress, subject, htmlBody, textBody);
        }
        public static void BookHotel(string customerName, string receiverAddress, string bookingID)
        {
            string subject = "Booking Confirmed";
            string htmlBody = @"<html>
<head></head>
<body>
  <h1>Thanks For Booking Hotel with Hotel Reservation System</h1>
  <p>Your Booking is confirmed.</p>
</body>
</html>" + "Your Booking ID is " + bookingID;
            string textBody = "Welcome\r" + customerName;
            ExecuteSendEmail(receiverAddress, subject, htmlBody, textBody);
        }
        public static void CancelReservation(string customerName, string receiverAddress, string bookingID)
        {
            string subject = "Reservation Cancelled";
            string htmlBody = "Your Booking with booking ID " + bookingID + " is seccessfully cancelled.\nThanks for choosing our services.";
            string textBody = "Welcome\r" + customerName;
            ExecuteSendEmail(receiverAddress, subject, htmlBody, textBody);
        }

        public static void PaymentConfirmation(string customerName, string receiverAddress, string bookingID, string amount, string TXNID)
        {
            string subject = "Payment Confirmation";
            string htmlBody = "Payment of RS." + amount + " for booking ID " + bookingID + " is seccessfully placed.\nYour Transaction ID is: "+TXNID;
            string textBody = "Welcome\r" + customerName;
            ExecuteSendEmail(receiverAddress, subject, htmlBody, textBody);
        }

        public static void ExecuteSendEmail(string receiverAddress, string subject, string htmlBody, string textBody)
        {
            using (var client = new AmazonSimpleEmailServiceClient(RegionEndpoint.USEast1))
            {
                var sendRequest = new SendEmailRequest
                {
                    Source = senderAddress,
                    Destination = new Destination
                    {
                        ToAddresses =
                        new List<string> { receiverAddress }
                    },
                    Message = new Message
                    {
                        Subject = new Content(subject),
                        Body = new Body
                        {
                            Html = new Content
                            {
                                Charset = "UTF-8",
                                Data = htmlBody
                            },
                            Text = new Content
                            {
                                Charset = "UTF-8",
                                Data = textBody
                            }
                        }
                    },
                };
                try
                {
                    var response = client.SendEmail(sendRequest);
                }
                catch (Exception ex)
                {
                    Utility.ExceptionUtility.ExceptionLog(ex);
                }
            }
        }
    }
}
