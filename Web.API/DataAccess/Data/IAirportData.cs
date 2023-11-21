using DataAccess.Models;

namespace DataAccess.Data
{
    public interface IAirportData
    {
        Task<AirportModel> GetAiportDetailsWithId(int id);
        Task<IEnumerable<AirportModel>> GetAirports();
    }
}