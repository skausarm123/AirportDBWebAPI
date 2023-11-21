using DataAccess.DBAccess;
using DataAccess.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Data
{
    public class CountriesData : ICountriesData
    {
        private readonly ISqlDataAccess _db;

        public CountriesData(ISqlDataAccess db)
        {
            _db = db;
        }
        public Task<IEnumerable<CountriesModel>> GetCountries() =>
            _db.LoadData<CountriesModel, dynamic>(storedProcedure: "SP_GetCountries", new { });

        public Task InsertCountries(CountriesModel countries) =>
            _db.SaveData(storedProcedure: "SP_InsertCountry", new { countries.Name });

        public Task DeleteCountry(int geographyLevel1ID) =>
            _db.SaveData(storedProcedure: "SP_DeleteCountry", new { GeographyLevel1ID = geographyLevel1ID });
    }
}
