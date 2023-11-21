namespace Web.API
{
    public static class API
    {
        public static void ConfigureAPI(this WebApplication app)
        {
            app.MapGet(pattern: "/airports", GetAirports);
            app.MapGet(pattern: "/airports/id", GetAirport);
            app.MapGet(pattern: "/countries", GetCountries);
            app.MapPost(pattern: "/countries", InsertCountry);
            app.MapDelete(pattern: "/countries", DeleteCountry);

        }
        private static async Task<IResult> GetAirports(IAirportData data)
        {
            try
            {
                return Results.Ok(await data.GetAirports());
            }
            catch (Exception ex)
            {
                return Results.Problem(ex.Message);
            }
        }
        private static async Task<IResult>GetAirport(int id,IAirportData data)
        {
            try
            {
                var results=await data.GetAiportDetailsWithId(id);
                if (results == null) return Results.NotFound(id);
                return Results.Ok(await data.GetAirports());
            }
            catch (Exception ex)
            {   
                return Results.Problem(ex.Message);
            }
        }

        private static async Task<IResult> GetCountries(ICountriesData data)
        {
            try
            {
                return Results.Ok(await data.GetCountries());
            }
            catch (Exception ex)
            {
                return Results.Problem(ex.Message);
            }
        }
        private static async Task<IResult> InsertCountry(CountriesModel country,ICountriesData data)
        {
            try
            {
                await data.InsertCountries(country);
                return Results.Ok();
            }
            catch(Exception ex)
            {
                return Results.Problem(ex.Message);
            }
        }
        private static async Task<IResult> DeleteCountry(int geographyLevel1ID, ICountriesData data)
        {
            try
            {
                await data.DeleteCountry(geographyLevel1ID);
                return Results.Ok();
            }
            catch (Exception ex)
            {
                return Results.Problem(ex.Message);
            }
        }
    }
}
