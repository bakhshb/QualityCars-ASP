using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccessLayers;
using System.Data.Common;
using System.Data;

namespace CatalogAccessLayers
{
    public struct CarDetails
    {
        public int Id;
        public int MakerId;
        public int SupplierId;
        public string ModelName;
        public int Year;
        public double Price;
        public string Feature;
        public string Image;

    }
    public class CatalogAccess
    {
        public CatalogAccess()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static DataTable GetCarMakeList()
        {
            DbCommand command = DataAccess.CreateCommand();
            command.CommandText = "sp_GetCarMake";
            return DataAccess.ExecuteSelectCommand(command);
        }

        public static DataTable GetCarMakeById(string makeId)
        {
            DbCommand command = DataAccess.CreateCommand();
            command.CommandText = "sp_GetCarMakeById";

            DbParameter param = command.CreateParameter();
            param.ParameterName = "@MakeId";
            param.Value = makeId;
            param.DbType = DbType.Int32;
            command.Parameters.Add(param);

            return DataAccess.ExecuteSelectCommand(command);
        }

        public static void AddCarMake( string name)
        {
            DbCommand command = DataAccess.CreateCommand();
            command.CommandText = "sp_AddNewCarMake";

            DbParameter param = command.CreateParameter();
            param.ParameterName = "@Name";
            param.Value = name;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            DataAccess.ExecuteSelectCommand(command);
        }

        public static DataTable GetCarModelList()
        {
            DbCommand command = DataAccess.CreateCommand();
            command.CommandText = "sp_GetCarModel";
            return DataAccess.ExecuteSelectCommand(command);
        }

        public static DataTable GetCarModelbyMakeId(string makeId)
        {
            DbCommand command = DataAccess.CreateCommand();
            command.CommandText = "sp_GetCarModelByMakeId";

            DbParameter param = command.CreateParameter();
            param.ParameterName = "@MakeID";
            param.Value = makeId;
            param.DbType = DbType.Int32;
            command.Parameters.Add(param);

            return DataAccess.ExecuteSelectCommand(command);
        }

        public static CarDetails GetCarDetailbyModelId(string modelId)
        {
            DbCommand command = DataAccess.CreateCommand();
            command.CommandText = "sp_GetCarDetailByModelId";

            DbParameter param = command.CreateParameter();
            param.ParameterName = "@ModelID";
            param.Value = modelId;
            param.DbType = DbType.Int32;
            command.Parameters.Add(param);

            DataTable table = DataAccess.ExecuteSelectCommand(command);

            CarDetails details = new CarDetails();
            if (table.Rows.Count > 0)
            {
                DataRow dr = table.Rows[0];
                details.Id = int.Parse(modelId);
                details.MakerId = int.Parse(dr["MakeId"].ToString());
                details.SupplierId = int.Parse(dr["SupplierId"].ToString());
                details.ModelName = dr["Name"].ToString();
                details.Year = int.Parse(dr["Year"].ToString());
                details.Price = double.Parse(dr["Price"].ToString());
                details.Feature = dr["Feature"].ToString();
                details.Image = dr["Image"].ToString();
            }
            return details;
        }

        public static void AddCarModel(string makeId, string supplierId, string name, string year, string price,  string feature, string image)
        {
            DbCommand command = DataAccess.CreateCommand();
            command.CommandText = "sp_AddNewCarModel";

            DbParameter param = command.CreateParameter();
            param.ParameterName = "@MakeId";
            param.Value = makeId;
            param.DbType = DbType.Int32;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@SupplierId";
            param.Value = supplierId;
            param.DbType = DbType.Int32;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@Name";
            param.Value = name;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@Year";
            param.Value = year;
            param.DbType = DbType.Int32;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@Price";
            param.Value = price;
            param.DbType = DbType.Double;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@Feature";
            param.Value = feature;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@Image";
            param.Value = image;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            DataAccess.ExecuteSelectCommand(command);
        }

        public static Boolean UserEmail (string email)
        {
            Boolean exist = false;
            DbCommand command = DataAccess.CreateCommand();
            command.CommandText = "sp_CheckEmailExist";

            DbParameter param = command.CreateParameter();
            param.ParameterName = "@Email";
            param.Value = email;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            int temp = Convert.ToInt32(DataAccess.ExecuteScaler(command));
            if (temp != 0)
            {
                exist = true;
            }
            else
            {
                exist = false;
            }
            return exist;
        }

        public static Boolean AdminEmail(string email)
        {
            Boolean exist = false;
            DbCommand command = DataAccess.CreateCommand();
            command.CommandText = "sp_CheckAdminEmailExist";

            DbParameter param = command.CreateParameter();
            param.ParameterName = "@Email";
            param.Value = email;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            int temp = Convert.ToInt32(DataAccess.ExecuteScaler(command));
            if (temp != 0)
            {
                exist = true;
            }
            else
            {
                exist = false;
            }
            return exist;
        }

        public static Boolean AccountStatus(string email)
        {
            Boolean enable = false;
            DbCommand command = DataAccess.CreateCommand();
            command.CommandText = "sp_CheckAccountStatus";

            DbParameter param = command.CreateParameter();
            param.ParameterName = "@Email";
            param.Value = email;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            int temp = Convert.ToInt32(DataAccess.ExecuteScaler(command));
            if (temp == 1)
            {
                enable = true;
            }
            else
            {
                enable = false;
            }
            return enable;
        }

        public static string[] UserInfo(string email)
        {
            string [] User = new string[4];
            DbCommand command = DataAccess.CreateCommand();
            command.CommandText = "sp_CheckUserLogin";

            DbParameter param = command.CreateParameter();
            param.ParameterName = "@Email";
            param.Value = email;
            param.DbType = DbType.String;
            command.Parameters.Add(param);
            DataTable table = DataAccess.ExecuteSelectCommand(command);
            if (table.Rows.Count > 0)
            {
                DataRow dr = table.Rows[0];
                User[0] = dr["Id"].ToString();
                User[1]=dr["FirstName"].ToString();
                User[2]=dr["LastName"].ToString();
                User[3]=dr["Password"].ToString().Replace(" ", "");
            }

            return User;
        }


        public static string [] AdminInfo (string email)
        {
            string [] Admin = new string[1]; 

            DbCommand command = DataAccess.CreateCommand();
            command.CommandText = "sp_CheckAdminLogin";

            DbParameter param = command.CreateParameter();
            param.ParameterName = "@Email";
            param.Value = email;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            DataTable table = DataAccess.ExecuteSelectCommand(command);

            if (table.Rows.Count > 0)
            {
                DataRow dr = table.Rows[0];
                Admin[0] = dr["Password"].ToString();

            }

            return Admin;

        }

        public static void AddCustomer(string id, string firstName, string lastName, string email, string password, string street, string subrub, string city,
                                            string zipcode, string landLine, string mobile, string fax, string status)
        {
            DbCommand command = DataAccess.CreateCommand();
            command.CommandText = "sp_AddNewCustomer";

            DbParameter param = command.CreateParameter();
            param.ParameterName = "@Id";
            param.Value = id;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@FirstName";
            param.Value = firstName;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@LastName";
            param.Value = lastName;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@Email";
            param.Value = email;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@Password";
            param.Value = password;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@Street";
            param.Value = street;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@Subrub";
            param.Value = subrub;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@City";
            param.Value = city;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@ZipCode";
            param.Value = zipcode;
            param.DbType = DbType.Int32;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@LandLine";
            param.Value = landLine;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@Mobile";
            param.Value = mobile;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@Fax";
            param.Value = fax;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@Status";
            param.Value = status;
            param.DbType = DbType.Int32;
            command.Parameters.Add(param);

            DataAccess.ExecuteSelectCommand(command);
        }

        public static Boolean SupplierEmail(string email)
        {
            Boolean exist = false;
            DbCommand command = DataAccess.CreateCommand();
            command.CommandText = "sp_CheckSupplierEmailExist";

            DbParameter param = command.CreateParameter();
            param.ParameterName = "@Email";
            param.Value = email;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            int temp = Convert.ToInt32(DataAccess.ExecuteScaler(command));
            if (temp != 0)
            {
                exist = true;
            }
            else
            {
                exist = false;
            }
            return exist;

        }

        public static void AddSupplier (string name, string email, string street, string subrub, string city,
                                    string zipcode, string landLine, string mobile, string fax)
        {
            DbCommand command = DataAccess.CreateCommand();
            command.CommandText = "sp_AddNewSupplier";

            DbParameter param = command.CreateParameter();
            param.ParameterName = "@Name";
            param.Value = name;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@Email";
            param.Value = email;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@Street";
            param.Value = street;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@Subrub";
            param.Value = subrub;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@City";
            param.Value = city;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@ZipCode";
            param.Value = zipcode;
            param.DbType = DbType.Int32;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@LandLine";
            param.Value = landLine;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@Mobile";
            param.Value = mobile;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@Fax";
            param.Value = fax;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            DataAccess.ExecuteSelectCommand(command);
        }

        public static void AddOrder(string CustomerId, string Status, string  Subtotal)
        {
            DbCommand command = DataAccess.CreateCommand();
            command.CommandText = "sp_AddNewOrder";

            DbParameter param = command.CreateParameter();
            param.ParameterName = "@CustomerId";
            param.Value = CustomerId;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@Status";
            param.Value = Status;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@Subtotal";
            param.Value = Subtotal;
            param.DbType = DbType.Double;
            command.Parameters.Add(param);

            DataAccess.ExecuteSelectCommand(command);

            
        }

        public static DataTable GetOrderByCustomerId(string CustomerId)
        {
            DbCommand command = DataAccess.CreateCommand();
            command.CommandText = "sp_GetOrderIdByCusId";

            DbParameter param = command.CreateParameter();
            param.ParameterName = "@CustomerId";
            param.Value = CustomerId;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            return DataAccess.ExecuteSelectCommand(command);
        }

        public static void AddOrderItem(string ModelId, string OrderId,  string Quantity, string Color, string Price)
        {
            DbCommand command = DataAccess.CreateCommand();
            command.CommandText = "sp_AddNewOrderItem";

            DbParameter param = command.CreateParameter();
            param = command.CreateParameter();
            param.ParameterName = "@ModelId";
            param.Value = ModelId;
            param.DbType = DbType.Int32;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@OrderId";
            param.Value = OrderId;
            param.DbType = DbType.Int32;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@Quantity";
            param.Value = Quantity;
            param.DbType = DbType.Int32;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@Color";
            param.Value = Color;
            param.DbType = DbType.String;
            command.Parameters.Add(param);

            param = command.CreateParameter();
            param.ParameterName = "@Price";
            param.Value = Price;
            param.DbType = DbType.Double;
            command.Parameters.Add(param);

            DataAccess.ExecuteSelectCommand(command);
        }
    }
}
