using System;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Student_Details : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|Student_DB.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                drpstate.Items.Clear();
                drpstate.Items.Add(new ListItem("-- Select State --", ""));
                //Display_data();
            }
        }

        protected void dropdownlist_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpstate.Items.Clear();
            if(drpcountry.SelectedValue == "India")
            {
                drpstate.Items.Add("Maharashtra");
                drpstate.Items.Add("goa");
                drpstate.Items.Add("gujrat");
                drpstate.Items.Add("Mp");
            }
            else if(drpcountry.SelectedValue == "USA")
            {
                drpstate.Items.Add("Alaska");
                drpstate.Items.Add("California");
                drpstate.Items.Add("Florida");
                drpstate.Items.Add("Hawaii");
            }
            else if(drpcountry.SelectedValue == "Dubai")
            {
                drpstate.Items.Add("Ajman");
                drpstate.Items.Add("Sharjah");
                drpstate.Items.Add("Abu Dhabi");
                drpstate.Items.Add("Ajman");
            }
        }

        protected void save_Click(object sender, EventArgs e)
        {
            try
            {
            
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Student(id,name,mob_no,email,country,state)  Values(@id,@name,@mob_no,@email,@country,@state)", con);
            cmd.Parameters.AddWithValue("@id",rollno.Text);
            cmd.Parameters.AddWithValue("@name",name.Text);
            cmd.Parameters.AddWithValue("@mob_no",mobileno.Text);
            cmd.Parameters.AddWithValue("@email",txtemail.Text);
            cmd.Parameters.AddWithValue("@country",drpcountry.SelectedValue);
            cmd.Parameters.AddWithValue("@state",drpstate.SelectedValue);
            cmd.ExecuteNonQuery();
            con.Close();
            }
            catch (Exception ex)
            {
                Console.Write(ex);
            }
            Display_data();
        }

       // Regex pattern = new Regex(@"\+[0-9]{3}\s+[0-9]{3}\s+[0-9]{5}\s+[0-9]{3}");

        public void Display_data()
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Student", con);
                cmd.ExecuteNonQuery();
                con.Close();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Console.Write(ex);
            }
        }
    }

    public class UrlTagValidationAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object mobileno, ValidationContext context)
        {
            string tag = mobileno as string;
            if (string.IsNullOrWhiteSpace(tag))
                return new ValidationResult("URL Tag is required.");

            var currentTrainer = context.ObjectInstance;
            //as TrainerModel;
            if (currentTrainer == null)
            {

            }
            using (var dbContext = new OnBoard101Entities())
            {
                if (dbContext.TrainerDetails.Any(td => td.Tag == tag && td.TrainerId !=
                                                currentTrainer.TrainerId))
                {
                    return new ValidationResult("This URL Tag is not available. Please enter a different one.");
                }
            }

            return ValidationResult.Success;
        }
    }


