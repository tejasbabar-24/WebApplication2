<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Details.aspx.cs" Inherits="WebApplication2.Student_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="js/JScript.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="conyainer">
            <div class="row">
                <h2>Registration Form</h2>
            </div>
            <div class="md-3">
                <label for="rollno" class="form-label">Roll No.</label>
                <asp:TextBox class="form-control" runat="server" ID="rollno"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Roll number" ControlToValidate="rollno" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <br />
            <div class="md-3">
            </div>
            <br />
            <div class="md-3">
                <label for="name" class="form-label">Name :</label>
                <asp:TextBox class="form-control" runat="server" ID="name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Name is required." ControlToValidate="name" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <br />
            <div class="md-3">
                <label for="phone" class="form-label">Phone No :</label>
                <asp:TextBox class="form-control" runat="server" ID="mobileno"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Mobile Number" ControlToValidate="mobileno" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="phoneValidator" runat="server" ControlToValidate="mobileno" ForeColor="Red"
                    ValidationExpression="^\d{10}$"
                    ErrorMessage="Phone number must be 10 digits."></asp:RegularExpressionValidator>
            </div>
            <br />
            <div class="md-3">
                <label for="email" class="form-label">Email :</label>
                <asp:TextBox class="form-control" runat="server" ID="txtemail"></asp:TextBox>
                <asp:RequiredFieldValidator ID="emailValidator" runat="server" ControlToValidate="txtemail" ForeColor="Red"
                    ErrorMessage="Email is required."></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="emailValidator2" runat="server" ControlToValidate="txtemail"
                    ValidationExpression="^\w+@[a-zA-Z_]+\.[a-zA-Z]{2,}$"
                    ErrorMessage="Invalid email format."></asp:RegularExpressionValidator>
            </div>
            <br />
            <br />
            <div class="md-3">
                <label for="country" class="form-label">Country :</label>
                <asp:DropDownList ID="drpcountry" AutoPostBack="true" OnSelectedIndexChanged="dropdownlist_SelectedIndexChanged" runat="server">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>India</asp:ListItem>
                    <asp:ListItem>USA</asp:ListItem>
                    <asp:ListItem>Dubai</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="drpcountry" ForeColor="Red"
                    ErrorMessage="Select Country."></asp:RequiredFieldValidator>
            </div>
            <br />
            <div class="md-3">
                <label for="state" class="form-label">State</label>
                <asp:DropDownList runat="server" ID="drpstate"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="drpstate" ForeColor="Red"
                    ErrorMessage="Select State."></asp:RequiredFieldValidator>
            </div>
            <br />
            <div class="md-6">
                <asp:Button runat="server" ID="save" class="btn btn-primary" OnClick="save_Click" Text="SAVE" />
            </div>
            <br />
            <div class="md-12">
                <asp:GridView ID="GridView1" runat="server">
                </asp:GridView>
            </div>
        </div>

    </form>
</body>
</html>
