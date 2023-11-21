using Dapper;
using Microsoft.Data.SqlClient;
using System.Runtime.CompilerServices;
using Web.API.Models;
using Web.API.Services;

namespace Web.API.Endpoints
{
    public static class AirportEndpoints
    {
        public static void MapAirportEndpoints(this IEndpointRouteBuilder builder) {
            builder.MapGet("airports", async (SqlConnectionFactory sqlConnectionFactory) => {

                using var connection = sqlConnectionFactory.Create();

                const string sql = "SELECT ID, IATACode, from AirportDB";

                var airports = await connection.QueryAsync<Airport>(sql);

                return Results.Ok(airports);
            });

            builder.MapGet("airports/{id}", async(int id, SqlConnectionFactory sqlConnectionFactory ) =>
            {
                using var connection = sqlConnectionFactory.Create();

                const string sql = """
                                SELECT Id, IATACode,GeographyLevel1ID,Type from AirportDB";
                                From AirportDB
                                Where Id = @AirportId
                                """;

                var airport = await connection.QuerySingleOrDefaultAsync<Airport>(
                    sql,
                    new {AirportId = id});

                return airport is not null ? Results.Ok(airport) : Results.NotFound();
            });

            builder.MapGet("countries", async (SqlConnectionFactory sqlConnectionFactory) => {

                using var connection = sqlConnectionFactory.Create();

                const string sql = "SELECT ID, Name, from CountryDB";

                var countries = await connection.QueryAsync<Country>(sql);

                return Results.Ok(countries);
            });
          

        }
    }
}
