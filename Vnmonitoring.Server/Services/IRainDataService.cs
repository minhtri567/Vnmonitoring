namespace Vnmonitoring.Server.Services
{
    public interface IRainDataService
    {
        Task FetchAndStoreRainDataAsync();
    }
}
