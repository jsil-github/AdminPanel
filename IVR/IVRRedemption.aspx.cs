using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class IVR_Default : Page
{
    private string dataSource = ConfigurationManager.ConnectionStrings["ConnectionStringTest"].ConnectionString;
    private string user_id = string.Empty;
    DataTable tbl = new DataTable();
    DAL.clsOracleConnection cn = new DAL.clsOracleConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        hideBankDetailForm();
        txtBalance.Attributes.Add("readonly", "true");
    }

    /*
     * This method loads the fund of investor
     * by getting his folio number. It only 
     * loads the fund where investor balance is not zero
     * */
    public void txtFolio_TextChanged(object sender, EventArgs e)
    {
      
        string folio_number = txtFolio.Text; 
       
        string getFundsQuery = @"select distinct f.fund_code,initcap(f.fund_name) as fund_name from unit_balance_electronic  ube
                        inner join fund f on f.fund_code = ube.fund_code
                            where ube.folio_number = '"+folio_number+ "' and get_fund_folio_balance(to_date(sysdate),ube.fund_code,ube.folio_number)>0 order by fund_name";

        tbl = DAL.OracleDataAccess.ExecuteDataset(cn.GetConnection(dataSource), CommandType.Text, getFundsQuery).Tables[0];
        dropDownFund.DataSource = tbl;
        dropDownFund.DataTextField = "fund_name";
        dropDownFund.DataValueField = "fund_code";
        dropDownFund.DataBind();
        string getBankDetailsQuery = @"select u.account_number,u.bank_name,u.bank_acc_title,u.bank_branch_code from unit_account u where u.folio_number='"+folio_number+"'";
        tbl = DAL.OracleDataAccess.ExecuteDataset(cn.GetConnection(dataSource), CommandType.Text, getBankDetailsQuery).Tables[0];
        try
        {
            txtAccountNumber.Text = tbl.Rows[0]["ACCOUNT_NUMBER"].ToString();
            txtBankAccountTitle.Text = tbl.Rows[0]["BANK_ACC_TITLE"].ToString();
            txtBankName.Text = tbl.Rows[0]["BANK_NAME"].ToString();
            txtBranch.Text = tbl.Rows[0]["BANK_BRANCH_CODE"].ToString();
        }

       
        catch(IndexOutOfRangeException myException)
        {
            showAlert("Account does not exist");
        }
    
    }
    /*
     * This method shows the desired message in the alert box
     */

    private void showAlert(string message)
    {
        Response.Write("<script>alert('"+message+"')</script>");
    }
    /**
     * This method gets the balance of selected fund
     * and loads into the balance textbox
     */
    protected void dropDownFundChangeEvent(object sender, EventArgs e)
    {
   
    
        String folio_number = txtFolio.Text;
        String fund_code = dropDownFund.SelectedValue;
    

        string getBalanceQuery = @"select round(get_fund_folio_balance(to_date(sysdate),'"+fund_code+"','"+folio_number+"')*get_fund_nav(to_date(sysdate),'"+fund_code+"'),0) as balance from dual";

        tbl = DAL.OracleDataAccess.ExecuteDataset(cn.GetConnection(dataSource), CommandType.Text, getBalanceQuery).Tables[0];
        txtBalance.Text = tbl.Rows[0]["BALANCE"].ToString();
        txtUnits.Text = "";
       

    }
    /**
     *This method shows the detail entered in redemption form
     *into a modal for user confirmation. 
     */
    protected void btnPreviewClick(object sender,EventArgs e)
    {
        string script = "$('#myModal').modal('show');";
        ClientScript.RegisterStartupScript(this.GetType(), "Popup", script, true);
        //folioLabel.Text = txtFolio.Text;
        folioText.Text = txtFolio.Text;
        fundText.Text = dropDownFund.SelectedItem.Text;
        redemptionTypeText.Text = dropDownRedemptionType.SelectedItem.Text;
        closingBalanceText.Text = txtBalance.Text;
        approximateUnitsText.Text = txtUnits.Text;
        paymentInstructionText.Text = dropDownPaymentType.SelectedItem.Text;
        bankAccountNoText.Text = txtAccountNumber.Text;
        bankAccountTitleText.Text = txtBankAccountTitle.Text;
        bankNameText.Text = txtBankName.Text;
        branchCodeText.Text = txtBranch.Text;
        if (divBankDetail1.Visible == true)
        {
            showBankDetailForm();
        }
        else
        {
            hideBankDetailForm();
        }
    }
    /**
     * This button performs the redemption transaction after the user confirmation
     */
    protected void btnRedemptionClick(object sender,EventArgs e)
    {
        string folio_number=folioText.Text;
        var fund_code = dropDownFund.SelectedValue;
        var uncertified_quantity = approximateUnitsText.Text;

        string getUserId = "select c.user_id from unit_account u inner join client c on c.client_code=u.primary_client where u.folio_number='" + folio_number + "'";
        tbl = DAL.OracleDataAccess.ExecuteDataset(cn.GetConnection(dataSource), CommandType.Text, getUserId).Tables[0];
        user_id = tbl.Rows[0]["USER_ID"].ToString();
        using (WebClient wc=new WebClient())
        {
            string token = "5B724ED0F467F565CA71D0ABF3DC781954521D1BEA10808F246932DDF1388376C46661CAC9892E9CA677FA55F8154A883E7149969C5F4627214EE10F9068E429B922324E37BD70F0F2637B9575B82D7B42386D6A1F867DF06C106D494C26DF174C85BA557F9912D0782BA74CB9022D753F43EFB56AD385F8B538D3654826597034A2D53841D3B7B9507B28177B2656D7733C798976B95ACF86B5C60635703EF8DB6C27F25F9CDE8F0035C3899D710D6D7C75EFC64719096F9ED3CEBDC209B977D59469601DA1D5BC91CE279CEFC5504B6F470629F3DC6C99D968056B7E76ECC7E8EC40AE09803B713A2FF9B1BA715CB354B1C3153951C3638CC170820FA316153EC959B87E5678151313F8F46C744E0C634C955D49EDB9ED7674755A1D8ED202CB213654BA07280116B5C673FE8EF123A1D6FC23783EF2B56616804E9EF27A7AF650CEEBDF7A1B627D58DC6698A58DE57ED82F4761016A66997B2EC6E9B8C2033C4472EBA09D46101C5EFBEA6F4D9F041E39F707A053D903B2D84934AF8D5AD07FB6940A6F065BB0E78510B2B46C1F1CD6FB32B7E3E99B911AFD577E8C9F0F66DB7A39D93F0B19F658123D4928188EDEA9C5DB0340654E32D5AABC47D5A1385CFC018A938E780D0036DC5C2B8CA584834F33A08FFAAD2D7E924F5799BCC88D3ECD95D89A79C3D72833FE9D9A694B16D5193258DC6425A369FA0424AD4D76BFA67FB59FB6E532E1E99A170F12166D981C";
            string content = @"{"+"\"folioNumber\":"+"\"" + folio_number + "\", " + "\"fundCode\":" + "\"" + fund_code + "\",\"redemptionTypeUnitsAmt\":\"U\",\"unCertifiedQty\":\""+txtUnits.Text+"\",\"redemptionAmount\":\"0\",\"userID\":\""+user_id+"\",\"unitClass\":\"XX\",\"unitPlan\":\"0\",\"paymentInstruction\":\"SB\"}";
            var Address = ConfigurationManager.AppSettings["baseApiAddress"] + "saveRedemption";
            wc.Headers[HttpRequestHeader.ContentType] = "application/json";
            wc.Headers.Add("apitoken", token);
            var HtmlResult = wc.UploadString(Address, "POST", content);
            var jsonApiResponseData = JObject.Parse(HtmlResult);
            var errorMsg = jsonApiResponseData["errorMsg"].ToString();
            var redemptionId = jsonApiResponseData["redemptionId"].ToString();
            if (redemptionId == "-1")
            {
                showAlert(errorMsg);
            }
            else
            {
                showAlert("Redemption has been submitted. Redemption Id is "+redemptionId);
            }


        }
    }
    /*This method load the bank detail form
     * depending on the payment mode. If mode is online
     * then this form will load otherwise this form will be hidden.
     */
    protected void dropDownPaymentTypeChange(object sender, EventArgs e)
    {
        string paymentType = dropDownPaymentType.SelectedItem.ToString();
        if (paymentType == "Online")
        {
            showBankDetailForm();
        }
        else
        {
            hideBankDetailForm();
        }

    }
    protected void redemptionTypeChange(object sender,EventArgs e)
    {
        string redemptionType = dropDownRedemptionType.SelectedItem.ToString();
        if (redemptionType == "Units")
        {
            lblUnits.InnerText = "Approximate Units";
            txtUnits.Text = "";
            txtUnits.Enabled = true;
        }
        else if (redemptionType == "Percentage")
        {
            lblUnits.InnerText = "Approximate Percentage";
            txtUnits.Text = "";
            txtUnits.Enabled = true;
        }
        else if(redemptionType=="All Units")
        {
            lblUnits.InnerText = "Approximate Amount";
            txtUnits.Text = txtBalance.Text;
            txtUnits.Enabled = false;
        }
    }

    protected void btnResetClick(object sender, EventArgs e)
    {
        txtFolio.Text = "";
        dropDownFund.Items.Clear();
        dropDownRedemptionType.SelectedIndex = 0;
        dropDownPaymentType.SelectedIndex = 0;
        txtBalance.Text = "";
        txtUnits.Text = "";
       

    }
    private void hideBankDetailForm()
    {
        divBankDetail1.Visible = false;
        divBankDetail2.Visible = false;
        divBankDetail3.Visible = false;
        divBankDetail4.Visible = false;
        divBankDetail5.Visible = false;
        divBankDetail6.Visible = false;
        divBankDetail7.Visible = false;
        divBankDetail8.Visible = false;
        divBankDetail9.Visible = false;
    }

    private void showBankDetailForm()
    {
        divBankDetail1.Visible = true;
        divBankDetail2.Visible = true;
        divBankDetail3.Visible = true;
        divBankDetail4.Visible = true;
        divBankDetail5.Visible = true;
        divBankDetail6.Visible = true;
        divBankDetail7.Visible = true;
        divBankDetail8.Visible = true;
        divBankDetail9.Visible = true;
    }
}



public class redemption
{
    public string folio { get; set; }
}