import 'package:flutter/material.dart';
import 'package:joblink/modelos/users_models.dart';
import '../../modelos/trabalho_models.dart';
import '../../services/data_base/sqlite.dart';

class HomeScreen extends StatelessWidget {
  final Usuario user;

  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JobLink'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Implementar notificações
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Implementar perfil
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Text(user.name[0].toUpperCase()),
                  ),
                  SizedBox(height: 10),
                  Text(
                    user.name,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    user.email,
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Meus Trabalhos'),
              onTap: () {
                // Implementar navegação
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Mensagens'),
              onTap: () {
                // Implementar navegação
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () {
                // Implementar navegação
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair'),
              onTap: () async {
                // Implementar logout
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bem-vindo, ${user.name}!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: Icon(Icons.add_circle,
                    color: Theme.of(context).primaryColor),
                title: Text('Criar Novo Trabalho'),
                onTap: () {
                  Navigator.pushNamed(context, '/create_job', arguments: user);
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Trabalhos Recentes',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Expanded(
              child: FutureBuilder<List<Trabalho>>(
                future: DatabaseHelper.instance.getTrabalhosByCidadao(user.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return Center(child: Text('Nenhum trabalho encontrado'));
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final job = snapshot.data![index];
                      return Card(
                        child: ListTile(
                          title: Text(job.titulo),
                          subtitle: Text(job.descricao),
                          trailing: Text(job.status),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create_job', arguments: user);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
