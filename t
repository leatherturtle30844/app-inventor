fun main() {
 
    while (true) {
        println("Escolha uma opção:")
        println("1. Entrar como usuário")
        println("2. Editar usuário")
        println("3. Adicionar usuário")
        println("4. Sair")

        when (readLine()) {
            "1" -> entrarComoUsuario(usuarios)
            "2" -> editarUsuario(usuarios)
            "3" -> adicionarUsuario(usuarios)
            "4" -> {
                println("Saindo...")
                return
            }
            else -> println("Opção inválida, tente novamente.")
        }
    }
}

val usuarios = mutableListOf<Usuario>()
data class Usuario(var nome: String, var senha: String)

fun entrarComoUsuario(usuarios: List<Usuario>) {
    println("Digite seu nome de usuário:")
    val nome = readLine()
    println("Digite sua senha:")
    val senha = readLine()

    val usuario = usuarios.find { it.nome == nome && it.senha == senha && senha.length <= 8  }
    if (usuario != null) {
        println("Bem-vindo, $nome!")
    } else {
        println("Usuário ou senha inválidos.")
    }
}

fun editarUsuario(usuarios: MutableList<Usuario>) {
    println("Digite o nome do usuário que deseja editar:")
    val nome = readLine()

    
    val usuario = usuarios.find { it.nome == nome }
    if (usuario != null) {
        println("Digite a nova senha:")
        val novaSenha = readLine()
        usuario.senha = novaSenha ?: usuario.senha
        println("Senha atualizada com sucesso!")
    } else {
        println("Usuário não encontrado.")
    }
}

fun adicionarUsuario(usuarios: MutableList<Usuario>) {
    println("Digite o nome do novo usuário:")
    val nome = readLine()
    println("Digite a senha do novo usuário:")
    val senha = readLine()

    if (nome != null && senha != null) {
        usuarios.add(Usuario(nome, senha))
        println("Usuário adicionado com sucesso!")
    } else {
        println("Nome e senha não podem ser nulos.")
    }
}
