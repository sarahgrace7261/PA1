using System.Collections.Generic;
using GT_admin_API.Models;
using MySql.Data.MySqlClient;

namespace GT_admin_API.Database.Read
{
    public class ReadBeacon
    {
        public List<Bluetooth> GetAll()
        {
            ConnectionString mycs = new ConnectionString();
            string cs = mycs.cs;
            using var con = new MySqlConnection(cs);
            con.Open();
            //gets all items sorted by name
            string stm = "SELECT * FROM beacon";
            using var cmd = new MySqlCommand(stm,con);
            using MySqlDataReader rdr = cmd.ExecuteReader();
            List<Bluetooth> myItems = new List<Bluetooth>();
            while(rdr.Read())
            {
                //creates the list from the database
                myItems.Add(new Bluetooth(){Id = rdr.GetInt32(0), BluetoothName = rdr.GetString(1), ExhibitId = rdr.GetInt32(2)});    
            }

    
            return myItems;
        }

        public Bluetooth GetOne(int btID)
        {
            ConnectionString mycs = new ConnectionString();
            string cs = mycs.cs;
            using var con = new MySqlConnection(cs);
            //Gets a specific item
            con.Open();
            string stm = "SELECT * FROM beacon WHERE bid = @btID";
            using var cmd = new MySqlCommand(stm, con);
            cmd.Parameters.AddWithValue("@btID", btID);
            cmd.Prepare();
            using MySqlDataReader rdr = cmd.ExecuteReader();

            rdr.Read();
            return new Bluetooth(){Id = rdr.GetInt32(0), BluetoothName = rdr.GetString(1), ExhibitId = rdr.GetInt32(2)};
            
        }
    }
}