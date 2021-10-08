using System.Collections.Generic;
using GT_admin_API.Models;
using MySql.Data.MySqlClient;

namespace GT_admin_API.Database.Read
{
    public class ReadMuseum
    {
         public List<Museum> GetAll()
        {
            ConnectionString mycs = new ConnectionString();
            string cs = mycs.cs;
            using var con = new MySqlConnection(cs);
            con.Open();
            //gets all items sorted by name
            string stm = "SELECT * FROM museum";
            using var cmd = new MySqlCommand(stm,con);
            using MySqlDataReader rdr = cmd.ExecuteReader();
            List<Museum> myItems = new List<Museum>();
            while(rdr.Read())
            {
                //creates the list from the database
                myItems.Add(new Museum(){Id = rdr.GetInt32(0), MuseumName = rdr.GetString(1), PictureLink = rdr.GetString(2), PhotoDescription = rdr.GetString(3)});    
            }

    
            return myItems;
        }

        public Museum GetOne(int mID)
        {
            ConnectionString mycs = new ConnectionString();
            string cs = mycs.cs;
            using var con = new MySqlConnection(cs);
            //Gets a specific item
            con.Open();
            string stm = "SELECT * FROM museum WHERE mid = @mID";
            using var cmd = new MySqlCommand(stm, con);
            cmd.Parameters.AddWithValue("@mID", mID);
            cmd.Prepare();
            using MySqlDataReader rdr = cmd.ExecuteReader();

            rdr.Read();
            return new Museum(){Id = rdr.GetInt32(0), MuseumName = rdr.GetString(1), PictureLink = rdr.GetString(2), PhotoDescription = rdr.GetString(3)};   
            
        }
    }
}