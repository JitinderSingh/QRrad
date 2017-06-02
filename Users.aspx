<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="Users" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="UserID" DataSourceID="SqlDataSource1" AllowPaging="True" 
            AllowSorting="True" Caption="Users">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="UserID" />
                <asp:BoundField DataField="LN" HeaderText="LN" SortExpression="LN" />
                <asp:BoundField DataField="FN" HeaderText="FN" SortExpression="FN" />
                <asp:BoundField DataField="CellNum" HeaderText="CellNum" 
                    SortExpression="CellNum" />
                <asp:BoundField DataField="Email" HeaderText="Email" 
                    SortExpression="Email" />
                <asp:BoundField DataField="Type" HeaderText="Type" 
                    SortExpression="Type" />
                <asp:BoundField DataField="FormalN" HeaderText="FormalN" SortExpression="FormalN" />
                <asp:BoundField DataField="PhoneNum" HeaderText="PhoneNum" SortExpression="PhoneNum" />
                <asp:BoundField DataField="PhotoUrl" HeaderText="PhotoUrl" SortExpression="PhotoUrl" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            SelectCommand="SELECT * FROM [Users]" 
            OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient">
        </asp:SqlDataSource>
    
        <br />
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
            AutoGenerateRows="False" Caption="Selected User" DataKeyNames="UserID" 
            DataSourceID="SqlDataSource2" EmptyDataText="Select a record..." Height="147px" 
            Width="228px">
            <Fields>
                <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False"  ReadOnly="True" SortExpression="UserID" />
                <asp:BoundField DataField="LN" HeaderText="LN" SortExpression="LN" />
                <asp:BoundField DataField="FN" HeaderText="FN" SortExpression="FN" />
                <asp:BoundField DataField="CellNum" HeaderText="CellNum"  SortExpression="CellNum" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:BoundField DataField="FormalN" HeaderText="FormalN"  SortExpression="FormalN" />
                <asp:BoundField DataField="PhoneNum" HeaderText="PhoneNum" SortExpression="PhoneNum" />
                <asp:ImageField DataImageUrlField="PhotoUrl" HeaderText="PhotoUrl">
                </asp:ImageField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowInsertButton="True" />
            </Fields>
            <PagerSettings Mode="NextPreviousFirstLast" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM [Users] WHERE [UserID] = @original_UserID AND [LN] = @original_LN AND [FN] = @original_FN AND [CellNum] = @original_CellNum AND [Email] = @original_Email AND [Type] = @original_Type AND (([FormalN] = @original_FormalN) OR ([FormalN] IS NULL AND @original_FormalN IS NULL)) AND (([PhoneNum] = @original_PhoneNum) OR ([PhoneNum] IS NULL AND @original_PhoneNum IS NULL)) AND (([PhotoUrl] = @original_PhotoUrl) OR ([PhotoUrl] IS NULL AND @original_PhotoUrl IS NULL))" 
            InsertCommand="INSERT INTO [Users] ([LN], [FN], [CellNum], [Email], [Type], [FormalN], [PhoneNum], [PhotoUrl]) VALUES (@LN, @FN, @CellNum, @Email, @Type, @FormalN, @PhoneNum, @PhotoUrl)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Users] WHERE ([UserID] = @UserID)" 
            
            
            
            UpdateCommand="UPDATE [Users] SET [LN] = @LN, [FN] = @FN, [CellNum] = @CellNum, [Email] = @Email, [Type] = @Type, [FormalN] = @FormalN, [PhoneNum] = @PhoneNum, [PhotoUrl] = @PhotoUrl WHERE [UserID] = @original_UserID AND [LN] = @original_LN AND [FN] = @original_FN AND [CellNum] = @original_CellNum AND [Email] = @original_Email AND [Type] = @original_Type AND (([FormalN] = @original_FormalN) OR ([FormalN] IS NULL AND @original_FormalN IS NULL)) AND (([PhoneNum] = @original_PhoneNum) OR ([PhoneNum] IS NULL AND @original_PhoneNum IS NULL)) AND (([PhotoUrl] = @original_PhotoUrl) OR ([PhotoUrl] IS NULL AND @original_PhotoUrl IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_UserID" Type="Int32" />
                <asp:Parameter Name="original_LN" Type="String" />
                <asp:Parameter Name="original_FN" Type="String" />
                <asp:Parameter Name="original_CellNum" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Type" Type="String" />
                <asp:Parameter Name="original_FormalN" Type="String" />
                <asp:Parameter Name="original_PhoneNum" Type="String" />
                <asp:Parameter Name="original_PhotoUrl" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="LN" Type="String" />
                <asp:Parameter Name="FN" Type="String" />
                <asp:Parameter Name="CellNum" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Type" Type="String" />
                <asp:Parameter Name="FormalN" Type="String" />
                <asp:Parameter Name="PhoneNum" Type="String" />
                <asp:Parameter Name="PhotoUrl" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="UserID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>     
                <asp:Parameter Name="LN" Type="String" />           
                <asp:Parameter Name="FN" Type="String" />
                <asp:Parameter Name="CellNum" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Type" Type="String" />
                <asp:Parameter Name="FormalN" Type="String" />
                <asp:Parameter Name="PhoneNum" Type="String" />
                <asp:Parameter Name="PhotoUrl" Type="String" />
                <asp:Parameter Name="original_UserID" Type="Int32" />
                <asp:Parameter Name="original_LN" Type="String" />
                <asp:Parameter Name="original_FN" Type="String" />
                <asp:Parameter Name="original_CellNum" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_Type" Type="String" />
                <asp:Parameter Name="original_FormalN" Type="String" />
                <asp:Parameter Name="original_PhoneNum" Type="String" />
                <asp:Parameter Name="original_PhotoUrl" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="bInsertImage" runat="server" onclick="bInsertImage_Click" 
            Text="Insert Image" />
        <asp:Image ID="Image1" runat="server" />
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
        <br />
        <br />
        <asp:Label ID="lbEnterAlias" runat="server" Text="Enter Alias"></asp:Label>
        <asp:TextBox ID="tbGetUser" runat="server"></asp:TextBox>
        <asp:Button ID="bGetUser" runat="server" onclick="bGetUser_Click" 
            Text="Get User" />
        <br />
        <asp:GridView ID="gvReturnedUser" runat="server" AutoGenerateColumns="False" 
            Width="499px" Height="143px">
            <Columns>
                <asp:BoundField DataField="FormalN" HeaderText="Name" />
                <asp:BoundField DataField="CellNum" HeaderText="Cell Number" ReadOnly="True" 
                    SortExpression="CellNum" />
                <asp:BoundField DataField="PhoneNum" HeaderText="Phone Number" 
                    SortExpression="PhoneNum" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:ImageField DataImageUrlField="PhotoUrl" HeaderText="Photo">
                </asp:ImageField>
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <asp:DetailsView ID="DetailsView2" runat="server" AllowPaging="True" 
            AutoGenerateRows="False" Caption="Selected Alias" DataKeyNames="index" 
            DataSourceID="SqlDataSourceSelectedAlias" Height="50px" Width="125px" 
            EmptyDataText="Select an alias...">
            <Fields>
                <asp:BoundField DataField="index" HeaderText="index" InsertVisible="False" 
                    ReadOnly="True" SortExpression="index" />
                <asp:BoundField DataField="UserID" HeaderText="UserID" 
                    SortExpression="UserID" />
                <asp:BoundField DataField="UserLN" HeaderText="UserLN" 
                    SortExpression="UserLN" />
                <asp:BoundField DataField="Alias" HeaderText="Alias" SortExpression="Alias" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSourceSelectedAlias" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM [Aliases] WHERE [index] = @original_index AND [UserID] = @original_UserID AND [UserLN] = @original_UserLN AND [Alias] = @original_Alias" 
            InsertCommand="INSERT INTO [Aliases] ([UserID], [UserLN], [Alias]) VALUES (@UserID, @UserLN, @Alias)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Aliases] WHERE ([index] = @index)" 
            UpdateCommand="UPDATE [Aliases] SET [UserID] = @UserID, [UserLN] = @UserLN, [Alias] = @Alias WHERE [index] = @original_index AND [UserID] = @original_UserID AND [UserLN] = @original_UserLN AND [Alias] = @original_Alias">
            <DeleteParameters>
                <asp:Parameter Name="original_index" Type="Int32" />
                <asp:Parameter Name="original_UserID" Type="Int32" />
                <asp:Parameter Name="original_UserLN" Type="String" />
                <asp:Parameter Name="original_Alias" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter Name="UserLN" Type="String" />
                <asp:Parameter Name="Alias" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView2" Name="index" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter Name="UserLN" Type="String" />
                <asp:Parameter Name="Alias" Type="String" />
                <asp:Parameter Name="original_index" Type="Int32" />
                <asp:Parameter Name="original_UserID" Type="Int32" />
                <asp:Parameter Name="original_UserLN" Type="String" />
                <asp:Parameter Name="original_Alias" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceAliases" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
            DeleteCommand="DELETE FROM [Aliases] WHERE [index] = @original_index AND [UserID] = @original_UserID AND [UserLN] = @original_UserLN AND [Alias] = @original_Alias" 
            InsertCommand="INSERT INTO [Aliases] ([UserID], [UserLN], [Alias]) VALUES (@UserID, @UserLN, @Alias)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [Aliases]" 
            UpdateCommand="UPDATE [Aliases] SET [UserID] = @UserID, [UserLN] = @UserLN, [Alias] = @Alias WHERE [index] = @original_index AND [UserID] = @original_UserID AND [UserLN] = @original_UserLN AND [Alias] = @original_Alias">
            <DeleteParameters>
                <asp:Parameter Name="original_index" Type="Int32" />
                <asp:Parameter Name="original_UserID" Type="Int32" />
                <asp:Parameter Name="original_UserLN" Type="String" />
                <asp:Parameter Name="original_Alias" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter Name="UserLN" Type="String" />
                <asp:Parameter Name="Alias" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter Name="UserLN" Type="String" />
                <asp:Parameter Name="Alias" Type="String" />
                <asp:Parameter Name="original_index" Type="Int32" />
                <asp:Parameter Name="original_UserID" Type="Int32" />
                <asp:Parameter Name="original_UserLN" Type="String" />
                <asp:Parameter Name="original_Alias" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" Caption="Aliases" 
            DataKeyNames="index" DataSourceID="SqlDataSourceAliases">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="index" HeaderText="index" InsertVisible="False" 
                    ReadOnly="True" SortExpression="index" />
                <asp:BoundField DataField="UserID" HeaderText="UserID" 
                    SortExpression="UserID" />
                <asp:BoundField DataField="UserLN" HeaderText="UserLN" 
                    SortExpression="UserLN" />
                <asp:BoundField DataField="Alias" HeaderText="Alias" SortExpression="Alias" />
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
