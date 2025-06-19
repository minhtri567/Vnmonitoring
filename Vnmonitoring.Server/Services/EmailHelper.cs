using System.Net;
using System.Net.Mail;

public class EmailHelper
{
    public static async Task SendEmailWithAttachmentAsync(string toEmail, string subject, string body, string attachmentPath)
    {
        var smtpHost = "smtp.ionos.com";
        var smtpPort = 587;
        var smtpUser = "vn@vietnammonitoring.com";
        var smtpPass = "Dongtri@2k30419";

        using var client = new SmtpClient(smtpHost, smtpPort)
        {
            Credentials = new NetworkCredential(smtpUser, smtpPass),
            EnableSsl = true
        };

        var message = new MailMessage
        {
            From = new MailAddress(smtpUser, "VN Monitoring"),
            Subject = subject,
            Body = body,
            IsBodyHtml = true
        };

        message.To.Add(toEmail);

        // Gắn file Excel
        var attachment = new Attachment(attachmentPath);
        message.Attachments.Add(attachment);

        await client.SendMailAsync(message);
    }
}
