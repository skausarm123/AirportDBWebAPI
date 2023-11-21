using DataAccess.Models;

namespace DataAccess.Data
{
    public interface IRouteData
    {
        Task<IEnumerable<RouteModel>> GetRoutes();
        Task InsertRoutes(RouteModel routes);
    }
}