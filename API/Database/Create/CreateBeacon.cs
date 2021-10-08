using GT_admin_API.Models;
using MySql.Data.MySqlClient;

namespace GT_admin_API.Database.Create
{
    public class CreateBeacon
    {
         public void Create(Bluetooth bluetooth){
            ConnectionString mycs = new ConnectionString();
            string cs = mycs.cs;
            using var con = new MySqlConnection(cs);
            con.Open();
            string stm = "select SQLite_Version()";
            using var cmd = new MySqlCommand(stm,con);
            //Adds the item to the database
            cmd.CommandText = @"INSERT INTO beacon(bid, bname, exid) VALUES(@id, @name, @exhibitId)";
            cmd.Parameters.AddWithValue("@id", bluetooth.Id);
            cmd.Parameters.AddWithValue("@name", bluetooth.BluetoothName);
            cmd.Parameters.AddWithValue("@exhibitId", bluetooth.ExhibitId);
            cmd.Prepare();
            cmd.ExecuteNonQuery();
        }
    }
}