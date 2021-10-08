using GT_admin_API.Models;
using MySql.Data.MySqlClient;

namespace GT_admin_API.Database.Update
{
    public class UpdateBeacon
    {
        public void Update(Bluetooth bluetooth)
        {
            ConnectionString mycs = new ConnectionString();
            string cs = mycs.cs;
            using var con = new MySqlConnection(cs);
            con.Open();
            string stm = "select MySQL_Version()";
            using var cmd = new MySqlCommand(stm,con);
            //Updates the item condition and availability in the database

            cmd.CommandText = @"UPDATE beacon SET bname = @bt_name, exid = @ex_id WHERE bt_ID = @bt_ID";
            cmd.Parameters.AddWithValue("@bt_ID", bluetooth.Id);
            cmd.Parameters.AddWithValue("@bt_name", bluetooth.BluetoothName);
            cmd.Parameters.AddWithValue("@ex_id", bluetooth.ExhibitId);
            cmd.Prepare();
            cmd.ExecuteNonQuery();
        }
    }
}