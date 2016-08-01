using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
    using System.Net.Mail;
using System.Net;

public class emailTest
{
    public emailTest(string toName, string toEmail, string outMessage, string outSubject)
    {
        var fromAddress = new MailAddress("cirosolution.app@gmail.com", "Ciro Solutions");
        var toAddress = new MailAddress(toEmail, toName);
        const string fromPassword = "prolazarus";
        string subject = outSubject;
        string body = outMessage;

        var smtp = new SmtpClient
        {
            Host = "smtp.gmail.com",
            Port = 587,
            EnableSsl = true,
            DeliveryMethod = SmtpDeliveryMethod.Network,
            Credentials = new NetworkCredential(fromAddress.Address, fromPassword),
            Timeout = 20000
        };
        using (var message = new MailMessage(fromAddress, toAddress)
        {
            Subject = subject,
            Body = body
        })
        {
            smtp.Send(message);
        }
    }
}
