Imports System.Data.SqlClient

Public Class Encuesta
    Inherits System.Web.UI.Page

    Protected Sub Guardar_datos_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnIniciarEncuesta.Click
        'se valida que todos los campos estn llenos
        If String.IsNullOrEmpty(Request.Form("fname")) OrElse
       String.IsNullOrEmpty(Request.Form("lname")) OrElse
       String.IsNullOrEmpty(Request.Form("fnacimiento")) OrElse
       String.IsNullOrEmpty(Request.Form("Correo")) OrElse
       String.IsNullOrEmpty(DropDownList1.SelectedValue) Then
            'mensaje de error para campos vacios
            lblErrorMessage.Text = "Por favor complete todos los campos."
            lblSuccessMessage.Text = ""
            Return
        End If

        'calcular la edad 
        Dim fechaNacimiento As DateTime
        If Not DateTime.TryParse(Request.Form("fnacimiento"), fechaNacimiento) Then
            'mostrar mensaje de error para fecha de nacimiento no valida
            lblErrorMessage.Text = "La fecha de nacimiento no es válida."
            lblSuccessMessage.Text = ""
            Return
        End If

        Dim edad As Integer = DateTime.Now.Year - fechaNacimiento.Year
        If (fechaNacimiento.Month > DateTime.Now.Month) OrElse
       (fechaNacimiento.Month = DateTime.Now.Month AndAlso fechaNacimiento.Day > DateTime.Now.Day) Then
            edad -= 1
        End If

        'validacion de la edad
        If edad < 18 OrElse edad > 50 Then
            'mensaje de error para edad fuera de rango
            lblErrorMessage.Text = "La edad debe estar entre 18 y 50 años."
            lblSuccessMessage.Text = ""
            Return
        End If

        'se definen los valores de CarroPropio y SinCarro segun la opcion seleccionada en el droplist
        Dim CarroPropio As Integer = If(DropDownList1.SelectedValue = "1", 1, 0)
        Dim SinCarro As Integer = If(DropDownList1.SelectedValue = "0", 1, 0)

        'se crea la conexion con la base de datos
        Using con As New SqlConnection(ConfigurationManager.ConnectionStrings("conexionsql").ConnectionString)
            Try
                con.Open()
                'comando SQL para insertar los datos de la encuesta
                Using cmd As New SqlCommand("INSERT INTO EncuestaUsuario (Nombre, Apellido, FechaNacimiento, Correo, CarroPropio, SinCarro) VALUES (@Nombre, @Apellido, @FechaNacimiento, @Correo, @CarroPropio, @SinCarro)", con)
                    cmd.Parameters.AddWithValue("@Nombre", Request.Form("fname"))
                    cmd.Parameters.AddWithValue("@Apellido", Request.Form("lname"))
                    cmd.Parameters.AddWithValue("@FechaNacimiento", fechaNacimiento)
                    cmd.Parameters.AddWithValue("@Correo", Request.Form("Correo"))
                    cmd.Parameters.AddWithValue("@CarroPropio", CarroPropio)
                    cmd.Parameters.AddWithValue("@SinCarro", SinCarro)

                    cmd.ExecuteNonQuery()
                    lblSuccessMessage.Text = "¡Los datos se ingresaron correctamente!"
                    lblErrorMessage.Text = ""
                End Using
            Catch ex As Exception

                lblSuccessMessage.Text = ""
                lblErrorMessage.Text = "Error al ingresar los datos: " & ex.Message
            End Try
        End Using
    End Sub
End Class
