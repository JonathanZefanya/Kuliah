using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Data;
using System.Windows.Forms;

namespace RestoKu
{
    class Connection
    {
        private string connectionString;
        public MySqlConnection connection;

        public MySqlCommand cmd = new MySqlCommand();
        public MySqlDataAdapter dataAdapter;
        public MySqlDataReader dataReader;
        public DataSet dataSet;
        public Connection()
        {
            connectionString = "Server=localhost;Port=3306;Database=restoku;Uid=root;Pwd=root;";
            connection = new MySqlConnection(connectionString);
        }
        public bool openConnection()
        {
            try
            {
                connection.Open();
                return true;
            }
            catch(MySqlException ex)
            {
                MessageBox.Show("Error: " + ex.Message, "ERROR !", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }
        public bool closeConnection()
        {
            try
            {
                connection.Close();
                return true;
            }
            catch (MySqlException ex)
            {
                MessageBox.Show("Error: " + ex.Message, "ERROR!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }
    }

}