Imports System.Data.SqlClient
Imports System.Configuration

Public Class Reportes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            MostrarReportes()
            MostrarDatosEncuesta()
        End If
    End Sub

    Protected Sub btnActualizar_Click(sender As Object, e As EventArgs) Handles btnActualizar.Click
        MostrarReportes()
    End Sub

    Private Sub MostrarReportes()
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("conexionsql").ConnectionString

        ' Consulta para obtener el total de personas que tienen carro
        Dim queryCarro As String = "SELECT COUNT(*) AS TotalCarro FROM EncuestaUsuario WHERE CarroPropio = 1;"

        ' Consulta para obtener el total de personas que no tienen carro
        Dim querySinCarro As String = "SELECT COUNT(*) AS TotalSinCarro FROM EncuestaUsuario WHERE CarroPropio = 0;"

        Using connection As New SqlConnection(connectionString)
            connection.Open()

            'total de encuestas y el promedio de edades
            Dim queryString As String = "SELECT COUNT(*) AS TotalEncuestas, AVG(DATEDIFF(YEAR, FechaNacimiento, GETDATE())) AS PromedioEdades " &
                                        "FROM EncuestaUsuario;"
            Dim command As New SqlCommand(queryString, connection)
            Dim reader As SqlDataReader = command.ExecuteReader()

            If reader.Read() Then
                'se asignan el total de encuestas y el promedio de edades a las etiquetas correspondientes
                lblTotalEncuestas.Text = reader("TotalEncuestas").ToString()
                lblPromedioEdades.Text = reader("PromedioEdades").ToString()
            End If

            reader.Close()

            ' ejecutar la consuta para obtener el total de personas que tienen carro
            command = New SqlCommand(queryCarro, connection)
            Dim totalCarro As Integer = Convert.ToInt32(command.ExecuteScalar())
            lblPorcentajeCarro.Text = totalCarro.ToString()

            'ejecutar la consuta para obtener el total de personas que no tienen carro
            command = New SqlCommand(querySinCarro, connection)
            Dim totalSinCarro As Integer = Convert.ToInt32(command.ExecuteScalar())
            lblPorcentajeSinCarro.Text = totalSinCarro.ToString()
        End Using
    End Sub
    Private Sub MostrarDatosEncuesta()
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("conexionsql").ConnectionString
        Dim queryString As String = "SELECT NumeroEncuesta, Nombre, Apellido, FechaNacimiento, Correo, CarroPropio FROM EncuestaUsuario;"

        Using connection As New SqlConnection(connectionString)
            Dim command As New SqlCommand(queryString, connection)
            Dim adapter As New SqlDataAdapter(command)
            Dim dataSet As New DataSet()

            connection.Open()
            adapter.Fill(dataSet)

            GridViewEncuesta.DataSource = dataSet
            GridViewEncuesta.DataBind()
        End Using
    End Sub



End Class