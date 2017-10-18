<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    
     <ContentTemplate>  
        <table class="nav-justified">
            <tr>
                <td style="width: 375px" >
        <asp:DataList ID="DataList1" OnItemCommand="DataList1_ItemCommand"
            OnItemDataBound="DataList1_ItemDataBound" RepeatDirection="Horizontal" runat="server">

            <SeparatorTemplate>
            </SeparatorTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="lnkbtnPaging" runat="server" CommandArgument='<%# Bind("PageIndex") %>'
                    Text='<%# Bind("PageText") %>'></asp:LinkButton>
            </ItemTemplate>
        </asp:DataList>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="LN" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCreated="GridView1_RowCreated" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True">
            <ItemStyle ForeColor="Blue" />
            </asp:CommandField>
            <asp:BoundField DataField="LN" HeaderText="Last Name" SortExpression="LN" />
            <asp:BoundField DataField="FN" HeaderText="First Name" SortExpression="FN" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerSettings Mode="NextPrevious" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
      
                <td>
    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" CellPadding="4" DataKeyNames="UserID" DataSourceID="SqlDataSourceUsers" ForeColor="#333333" HeaderText="Selected User" Width="252px" EmptyDataText="No user selected" OnItemInserted="FormView1_ItemInserted" OnPageIndexChanged="GridView1_SelectedIndexChanged">
        <EditItemTemplate>
            UserID:
            <asp:Label ID="UserIDLabel1" runat="server" Text='<%# Eval("UserID") %>' />
            <br />
            Last Name:
            <asp:TextBox ID="LNTextBox" runat="server" Text='<%# Bind("LN") %>' />
            <br />
            First Name:
            <asp:TextBox ID="FNTextBox" runat="server" Text='<%# Bind("FN") %>' />
            <br />
            Cell Number:
            <asp:TextBox ID="CellNumTextBox" runat="server" Text='<%# Bind("CellNum") %>' />
            <br />
            Email:
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            Type:
            <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
            <br />
            Full Name:
            <asp:TextBox ID="FormalNTextBox" runat="server" Text='<%# Bind("FormalN") %>' />
            <br />
            Phone Number:
            <asp:TextBox ID="PhoneNumTextBox" runat="server" Text='<%# Bind("PhoneNum") %>' />
            <br />
            Photo:<asp:FileUpload ID="FileUpload1" runat="server"  />

            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            Last Name:
            <asp:TextBox ID="LNTextBox0" runat="server" Text='<%# Bind("LN") %>' />
            <br />
            First Name:
            <asp:TextBox ID="FNTextBox0" runat="server" Text='<%# Bind("FN") %>' />
            <br />
            Cell Number:
            <asp:TextBox ID="CellNumTextBox0" runat="server" Text='<%# Bind("CellNum") %>' />
            <br />
            Email:
            <asp:TextBox ID="EmailTextBox0" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            Type:
            <asp:TextBox ID="TypeTextBox0" runat="server" Text='<%# Bind("Type") %>' />
            <br />
            Full Name:
            <asp:TextBox ID="FormalNTextBox0" runat="server" Text='<%# Bind("FormalN") %>' />
            <br />
            Phone Number:
            <asp:TextBox ID="PhoneNumTextBox0" runat="server" Text='<%# Bind("PhoneNum") %>' />
            <br />
            Photo:<asp:FileUpload ID="FileUpload1" runat="server" />
           
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            UserID: <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
            <br />
            Last Name:
            <asp:Label ID="LNLabel" runat="server" Text='<%# Bind("LN") %>' />
            <br />
            First Name:
            <asp:Label ID="FNLabel" runat="server" Text='<%# Bind("FN") %>' />
            <br />
            Cell Number:
            <asp:Label ID="CellNumLabel" runat="server" Text='<%# Bind("CellNum") %>' />
            <br />
            Email:
            <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            Type:
            <asp:Label ID="TypeLabel" runat="server" Text='<%# Bind("Type") %>' />
            <br />
            Full Name:
            <asp:Label ID="FormalNLabel" runat="server" Text='<%# Bind("FormalN") %>' />
            <br />
            Phone Number:
            <asp:Label ID="PhoneNumLabel" runat="server" Text='<%# Bind("PhoneNum") %>' />
            <br />

             <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />

            <br />
            <asp:Image id="Image1" runat="server"
           AlternateText="Image text"
           ImageAlign="left"
           ImageUrl='<%# Eval("PhotoUrl") %>'/>
            

        </ItemTemplate>
        
        <PagerSettings Mode="NextPreviousFirstLast" />
        
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        
        <RowStyle BackColor="#E3EAEB" />
        
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="Data Source=QRradDB.db.11805746.hostedresource.com;Initial Catalog=QRradDB;Persist Security Info=True;User ID=QRradDB;Password=QR!Qoder987" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Users] WHERE ([LN] = @LN)" OldValuesParameterFormatString="original_{0}" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Users] WHERE [UserID] = @original_UserID AND [LN] = @original_LN AND [FN] = @original_FN AND [CellNum] = @original_CellNum AND [Email] = @original_Email AND [Type] = @original_Type AND (([FormalN] = @original_FormalN) OR ([FormalN] IS NULL AND @original_FormalN IS NULL)) AND (([PhoneNum] = @original_PhoneNum) OR ([PhoneNum] IS NULL AND @original_PhoneNum IS NULL)) AND (([PhotoUrl] = @original_PhotoUrl) OR ([PhotoUrl] IS NULL AND @original_PhotoUrl IS NULL))" InsertCommand="INSERT INTO [Users] ([LN], [FN], [CellNum], [Email], [Type], [FormalN], [PhoneNum], [PhotoUrl]) VALUES (@LN, @FN, @CellNum, @Email, @Type, @FormalN, @PhoneNum, @PhotoUrl)" UpdateCommand="UPDATE [Users] SET [LN] = @LN, [FN] = @FN, [CellNum] = @CellNum, [Email] = @Email, [Type] = @Type, [FormalN] = @FormalN, [PhoneNum] = @PhoneNum, [PhotoUrl] = @PhotoUrl WHERE [UserID] = @original_UserID AND [LN] = @original_LN AND [FN] = @original_FN AND [CellNum] = @original_CellNum AND [Email] = @original_Email AND [Type] = @original_Type AND (([FormalN] = @original_FormalN) OR ([FormalN] IS NULL AND @original_FormalN IS NULL)) AND (([PhoneNum] = @original_PhoneNum) OR ([PhoneNum] IS NULL AND @original_PhoneNum IS NULL)) AND (([PhotoUrl] = @original_PhotoUrl) OR ([PhotoUrl] IS NULL AND @original_PhotoUrl IS NULL))">
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
            <asp:ControlParameter ControlID="GridView1" Name="LN" PropertyName="SelectedValue" Type="String" />
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
                </td>

                <td>

 
                    <br />
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="index" DataSourceID="SqlDataSourceAliases" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True">
                            <ItemStyle ForeColor="#0066FF" />
                            </asp:CommandField>
                            <asp:BoundField DataField="Alias" HeaderText="Signatures" SortExpression="Alias" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>

                      <asp:SqlDataSource ID="SqlDataSourceAliases" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Aliases] WHERE ([UserID] = @UserID)" ProviderName="System.Data.SqlClient">
                      <SelectParameters>
                     <asp:ControlParameter ControlID="FormView1" Name="UserID" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    </asp:SqlDataSource>
                    <br />

                </td>
                <td>
                    <asp:DetailsView ID="DetailsView2" runat="server" AllowPaging="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="index" DataSourceID="SqlDataSourceSelectedAlias" ForeColor="#333333" GridLines="None" Height="50px" Width="125px">
                        <AlternatingRowStyle BackColor="White" />
                        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                        <Fields>
                            <asp:BoundField DataField="Alias" HeaderText="Signature" SortExpression="Alias" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                        </Fields>
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSourceSelectedAlias" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Aliases] WHERE [index] = @original_index AND [UserID] = @original_UserID AND [UserLN] = @original_UserLN AND [Alias] = @original_Alias" InsertCommand="INSERT INTO [Aliases] ([UserID], [UserLN], [Alias]) VALUES (@UserID, @UserLN, @Alias)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Aliases] WHERE ([index] = @index)" UpdateCommand="UPDATE [Aliases] SET [UserID] = @UserID, [UserLN] = @UserLN, [Alias] = @Alias WHERE [index] = @original_index AND [UserID] = @original_UserID AND [UserLN] = @original_UserLN AND [Alias] = @original_Alias">
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
                            <asp:ControlParameter ControlID="GridView2" Name="index" PropertyName="SelectedValue" Type="Int32" />
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
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 375px">&nbsp;</td>
                <td style="width: 323px">&nbsp;</td>
            </tr>
        </table>
        </ContentTemplate> 
     
        </asp:UpdatePanel>  

   
        
    </asp:Content>

