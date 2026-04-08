namespace Vnmonitoring.Server.Utilities
{
    /// <summary>
    /// Helper class for Vietnamese timezone (UTC+7)
    /// </summary>
    public static class TimeZoneHelper
    {
        private static readonly TimeZoneInfo VietnamTimeZone = TimeZoneInfo.FindSystemTimeZoneById("SE Asia Standard Time");

        /// <summary>
        /// Gets the current date and time in Vietnamese timezone (UTC+7)
        /// </summary>
        public static DateTime GetVietnamNow()
        {
            return TimeZoneInfo.ConvertTime(DateTime.UtcNow, VietnamTimeZone);
        }

        /// <summary>
        /// Gets the current date in Vietnamese timezone
        /// </summary>
        public static DateTime GetVietnamToday()
        {
            var vietnamNow = GetVietnamNow();
            return vietnamNow.Date;
        }

        /// <summary>
        /// Converts a UTC DateTime to Vietnamese timezone
        /// </summary>
        public static DateTime ConvertToVietnamTime(DateTime utcDateTime)
        {
            if (utcDateTime.Kind != DateTimeKind.Utc)
            {
                utcDateTime = DateTime.SpecifyKind(utcDateTime, DateTimeKind.Utc);
            }
            return TimeZoneInfo.ConvertTime(utcDateTime, VietnamTimeZone);
        }

        /// <summary>
        /// Converts a Vietnamese local time to UTC
        /// </summary>
        public static DateTime ConvertToUtc(DateTime vietnamDateTime)
        {
            return TimeZoneInfo.ConvertTimeToUtc(vietnamDateTime, VietnamTimeZone);
        }
    }
}
