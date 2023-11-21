using DataAccess.DBAccess;
using DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Data
{
    public class AirportData : IAirportData
    {
        private readonly ISqlDataAccess _db;

        public AirportData(ISqlDataAccess db)
        {
            _db = db;
        }
        public Task<IEnumerable<AirportModel>> GetAirports() =>
            _db.LoadData<AirportModel, dynamic>(storedProcedure: "SP_GetAirportDetails", new { });

        public async Task<AirportModel> GetAiportDetailsWithId(int Id)
        {
            var results = await _db.LoadData<AirportModel, dynamic>(storedProcedure: "SP_GetAiportDetailWithID", new { Id = Id });
            return results.FirstOrDefault();
        }
    }
}
