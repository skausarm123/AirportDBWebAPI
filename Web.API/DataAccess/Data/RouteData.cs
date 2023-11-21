using DataAccess.DBAccess;
using DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Data
{
    public class RouteData : IRouteData
    {
        private readonly ISqlDataAccess _db;

        public RouteData(ISqlDataAccess db)
        {
            _db = db;
        }
        public Task<IEnumerable<RouteModel>> GetRoutes() =>
            _db.LoadData<RouteModel, dynamic>(storedProcedure: "SP_GetRoutes", new { });

        public Task InsertRoutes(RouteModel routes) =>
            _db.SaveData(storedProcedure: "SP_InsertRoute", new { routes.DepartureAirportID, routes.ArrivalAirportID });

    }
}
