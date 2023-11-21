using Dapper;
using DataAccess.DBAccess;
using Microsoft.Data.SqlClient;
using Web.API;
using Web.API.Endpoints;
using Web.API.Models;
using Web.API.Services;

var builder = WebApplication.CreateBuilder(args);


builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddSingleton<ISqlDataAccess, SqlDataAccess>();
builder.Services.AddSingleton<IAirportData, AirportData>();
builder.Services.AddSingleton<ICountriesData,CountriesData>();


var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.ConfigureAPI(); 


app.Run();


