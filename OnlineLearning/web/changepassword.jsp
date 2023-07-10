<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Change Password</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/changepassword.css">
    </head>
    <body>
        <div class="container">
            <h3>Change Password</h3>
            <form action="ChangePasswordServlet" method="post">
                <div class="form-group">
                    <label for="current-password">Current Password</label>
                    <input type="password" class="form-control" id="current-password" name="current-password" required>
                </div>
                <div class="form-group">
                    <label for="new-password">New Password</label>
                    <input type="password" class="form-control" id="new-password" name="new-password" required>
                </div>
                <div class="form-group">
                    <label for="confirm-password">Confirm Password</label>
                    <input type="password" class="form-control" id="confirm-password" name="confirm-password" required>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
                ${requestScope.errorMessage}
            </form>
            <div class="mt-4 text-center" style="height: 150px;">
            </div>
        </div>
    </body>
</html>
