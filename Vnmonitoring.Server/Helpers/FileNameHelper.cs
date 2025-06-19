using System.Globalization;
using System.Text;
using System.Text.RegularExpressions;

namespace Vnmonitoring.Server.Helpers
{
    public static class FileNameHelper
    {
        public static string NormalizeFileName(string input)
        {
            if (string.IsNullOrEmpty(input))
                return input;

            string cleaned = RemoveDiacritics(input);

            // Thay thế tất cả ký tự không phải chữ, số bằng dấu gạch dưới
            cleaned = Regex.Replace(cleaned, @"[^a-zA-Z0-9\.]", "_");

            cleaned = Regex.Replace(cleaned, @"_+", "_");

            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var random = new Random();
            string randomString = new string(Enumerable.Repeat(chars, 6)
                .Select(s => s[random.Next(s.Length)]).ToArray());

            int lastDot = cleaned.LastIndexOf('.');
            if (lastDot >= 0)
            {
                string name = cleaned.Substring(0, lastDot).Trim('_');
                string extension = cleaned.Substring(lastDot);
                cleaned = $"{name}_{randomString}{extension}";
            }
            else
            {
                cleaned = $"{cleaned.Trim('_')}_{randomString}";
            }

            return cleaned;
        }
        private static string RemoveDiacritics(string text)
        {
            string normalized = text.Normalize(NormalizationForm.FormD);
            var sb = new StringBuilder();

            foreach (char c in normalized)
            {
                UnicodeCategory category = System.Globalization.CharUnicodeInfo.GetUnicodeCategory(c);

                if (c == 'đ' || c == 'Đ' || category != System.Globalization.UnicodeCategory.NonSpacingMark)
                {
                    sb.Append(c);
                }
            }

            string result = sb.ToString().Normalize(NormalizationForm.FormC);

            result = result.Replace('đ', 'd').Replace('Đ', 'D');

            return result;
        }
    }
}
