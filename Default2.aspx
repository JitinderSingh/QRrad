<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:DataList ID="DataList1" OnItemCommand="DataList1_ItemCommand"
            OnItemDataBound="DataList1_ItemDataBound" RepeatDirection="Horizontal" runat="server">

        <SeparatorTemplate>

            </SeparatorTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="lnkbtnPaging" runat="server" CommandArgument='<%# Bind("PageIndex") %>'
                    Text='<%# Bind("PageText") %>'></asp:LinkButton>
            </ItemTemplate>
        </asp:DataList>

        <br />

        <asp:GridView ID="GridView1" runat="server" EmptyDataText="No Records Found">
        </asp:GridView>

</asp:Content>

