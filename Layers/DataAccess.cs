using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using System.Data;
using System.Configuration;
using System.Web;


namespace DataAccessLayers
{
    public class DataAccess
    {
        private static string _dbConnectionString;
        private static string _dbProviderName;

        public DataAccess()
        {

        }

        public static DbCommand CreateCommand()
        {
            _dbConnectionString = ConfigurationManager.ConnectionStrings["QualityCarConnectionString"].ConnectionString;
            _dbProviderName = ConfigurationManager.ConnectionStrings["QualityCarConnectionString"].ProviderName;
           
            DbProviderFactory factory = DbProviderFactories.GetFactory(_dbProviderName);
            DbConnection connection = factory.CreateConnection();
            connection.ConnectionString = _dbConnectionString;


            DbCommand command = connection.CreateCommand();

            command.CommandType = CommandType.StoredProcedure;

            return command;
        }

        public static DataTable ExecuteSelectCommand(DbCommand command)
        {
            DataTable table;

            try
            {
                command.Connection.Open();
                DbDataReader reader = command.ExecuteReader();
                table = new DataTable();
                table.Load(reader);
                reader.Close();

            }
            catch (Exception ex)
            {
                
                throw;

            }
            finally
            {
                command.Connection.Close();
                
            }
            return table;
        }

        // execute an update, delete, or insert command
        // and return the number of affected rows
        public static int ExecuteNonQuery(DbCommand command)
        {
            int affectedRows = -1;
            try
            {
                command.Connection.Open();
                affectedRows = command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                command.Connection.Close();
            }

            return affectedRows;
        }
        // execute a select command and return a single result as a string
        public static string ExecuteScaler(DbCommand command)
        {
            string result = "";
            try
            {
                command.Connection.Open();
                result = command.ExecuteScalar().ToString();
            }
            catch (Exception ex)
            {
                
            }
            finally
            {
                command.Connection.Close();
            }

            return result;
        }
    }
}
