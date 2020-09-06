using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Configuration;

namespace Utility
{
    public class ExceptionUtility
    {
        public static void ExceptionLog(Exception ex)
        {
            string path = ConfigurationManager.AppSettings["ErrorLogPath"].ToString();
            using(StreamWriter sw = File.AppendText(path))
            {
                sw.WriteLine(DateTime.Now);
                sw.WriteLine(ex.Message);
                sw.WriteLine("--------------------------------------------------------------------------------");
            }
        }
    }
}
