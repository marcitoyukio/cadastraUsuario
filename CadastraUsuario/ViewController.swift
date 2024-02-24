//
//  ViewController.swift
//  CadastraUsuario
//
//  Created by Marcio Yukio on 24/02/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    var usuarios: [Usuario] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Configurar dataSource e delegate para a tableView
        tableView.dataSource = self
        tableView.delegate = self
    }

    // Método para responder ao botão de cadastro pressionado
    @IBAction func cadastroButtonPressed(_ sender: UIButton) {
        guard let nome = nomeTextField.text, let email = emailTextField.text else {
            return
        }

        // Verificar se o nome e o email não estão vazios
        if nome.isEmpty || email.isEmpty {
            return
        }

        // Criar um novo usuário com os dados fornecidos
        let novoUsuario = Usuario(nome: nome, email: email)
        usuarios.append(novoUsuario)

        // Limpar os campos de texto após o cadastro
        nomeTextField.text = ""
        emailTextField.text = ""

        // Recarregar a tableView para refletir a adição do novo usuário
        tableView.reloadData()
    }

    // Implementação dos métodos do UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usuarios.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsuarioCell", for: indexPath)
        let usuario = usuarios[indexPath.row]
        cell.textLabel?.text = usuario.nome
        cell.detailTextLabel?.text = usuario.email
        return cell
    }
}
