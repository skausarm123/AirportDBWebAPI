using DataAccess.Models;

namespace DataAccess.Data
{
    public interface ICountriesData
    {
        Task DeleteCountry(int geographyLevel1ID);
        Task<IEnumerable<CountriesModel>> GetCountries();
        Task InsertCountries(CountriesModel countries);
    }
}