<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgot_password.aspx.cs" Inherits="BloodBankSystem.forgot_password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Forgot Password – LifeFlow</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="auth-wrapper d-flex align-items-center justify-content-center min-vh-100 bg-light">
            <div class="card shadow p-4" style="max-width: 450px; width: 100%;">
                <h3 class="fw-800 text-secondary mb-2">Forgot Password</h3>
                <p class="text-muted small mb-4">Enter your registered email address to find your password.</p>
                <div class="mb-3">
                    <label class="form-label text-muted small fw-600">Email Address</label>
                    <asp:TextBox ID="txteml" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
                </div>
                <div class="mb-3 text-center">
                    <asp:Label ID="lblmsg" runat="server" Font-Bold="true"></asp:Label>
                </div>
                <asp:Button ID="btn" runat="server" Text="Get Password" CssClass="btn btn-danger w-100 mb-3" OnClick="btn_Click" />
                <a href="login.aspx" class="text-muted small text-center d-block">Back to Login</a>
            </div>
        </div>
    </form>
</body>
</html>
