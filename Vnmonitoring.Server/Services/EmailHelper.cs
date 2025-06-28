using System.Net;
using System.Net.Mail;
using Microsoft.Extensions.Options;

public class EmailHelper
{
    private readonly SmtpSettings _smtpSettings;

    public EmailHelper(IOptions<SmtpSettings> smtpSettings)
    {
        _smtpSettings = smtpSettings.Value;
    }
    public async Task SendEmailWithAttachmentAsync(string toEmail, string subject, string body, string attachmentPath)
    {
        var smtpHost = _smtpSettings.Host;
        var smtpPort = _smtpSettings.Port;
        var smtpUser = _smtpSettings.Username;
        var smtpPass = _smtpSettings.Password;

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
    public class SmtpSettings
    {
        public string Host { get; set; }
        public int Port { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
    }

}
