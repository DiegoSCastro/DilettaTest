# My Wishlist
![gif1](https://github.com/user-attachments/assets/ca998d6a-ed91-4641-b2d7-f310c4712987)

**My Wishlist**  A aplicação é um exemplo de como fazer uma wishlist simples utilizando armazenamento local com boas práticas de arquitetura e testes automatizados.

### API Utilizada:
https://fakestoreapi.com/

### Instruções para Rodar:

Esta aplicação foi desenvolvida utilizando a versão 3.5.3 do Flutter. Para rodá-la, você precisará de Flutter versão 3.0.0 ou superior e Dart versão 3.5 ou superior instalados.

1. **Clonar o Repositório:**  
   Clone este repositório em sua máquina local.

2. **Instalar Dependências:**  
   Abra o projeto e execute o seguinte comando para instalar as dependências:  
   ```bash
   flutter pub get

3. **Rodar os Testes:**  
   Para rodar os testes automatizados, use:
   ```bash
   flutter test

4. **Executar o Aplicativo:**
   Você também poderá executar o projeto como usuário ou QA baixando o apk abaixo:
   https://drive.google.com/file/d/1p6LG4fUvnTNEZdbEzdJyR9gFGu1THol7/view?usp=sharing

   Gerar apk release:
    ```bash
   flutter build apk --dart-define=baseUrl=https://fakestoreapi.com/ --dart-define=connectTimeout=5000 --dart-define=receiveTimeout=15000

### Funcionalidades:

- **Home Screen:**  
  Permite ver todos os produtos e adicionar os itens favoritos a wishlist pressionando o icone de coração. É possivel procurar um produto através da barra de busca. Caso tenha pelo menos 1 produto na lista de desejos, aparecerá o botão que permite navegar para a tela wishlist.

- **Wishlist:**  
  Onde estão agrupados todos os itens da lista de desejos, nela é possivel pressionar em 1 item para ver os detalhes ou voltar para a tela anterior.

- **Detalhes:**  
  Tela onde é possivel visualizar todos os detalhes do produto.

### Packages Used:

- **Testes Unitários e de Widget:**  
  Para garantir a qualidade do app, foram implementados testes unitários e de widget utilizando os pacotes flutter_test e mocktail. O projeto atualmente possui mais de 50% de cobertura de testes.

- **Injeção de Dependências:**  
  O pacote get_it é utilizado para injeção de dependências, tornando o código mais modular e fácil de testar.

- **Armazenamento Local de Dados:**  
  O pacote shared_preferences é utilizado para armazenar dados localmente de forma eficiente.

- **Gerenciamento de Estado:**  
  O gerenciamento de estado é feito utilizando flutter_bloc e cubit, permitindo que a interface do usuário seja atualizada de forma reativa com as mudanças nos dados.

- **Arquitetura:**  
  Princípios SOLID e Clean Architecture foram aplicados para garantir a manutenibilidade, escalabilidade e testabilidade do código.

## Instruções

### DilettaTest
Desafio técnico - Flutter

Desafio: Essa é uma vaga para desenvolvedor Flutter (Mobile), e pensamos em um teste simples para avaliar o desempenho na stack. A ideia desse desafio é criar uma aplicação de listagem de produtos.

Na escolha do backend também deixaremos livre, os dados podem ser adquiridos de uma API free, ou mesmo podem ser adicionados via https://mockapi.io/

Componentes: Faça a listagem como bem entender, traga os produtos do backend via API e crie uma wishlist baseada nessa lista de produtos. Basicamente é adicionar alguns produtos nessa lista de desejos. Você tem autonomia no design, pode colocar em duas telas, uma página à parte, você é o dono da aplicação.

Regras de Negócio: Cada usuário poderá criar sua própria wishlist. Você é livre para escolher qual gerenciador de estado prefere, adicione os filtros que achar pertinente para a manipulação da wishlist.

A ideia será criar um pull request nesse repositório para ser avaliado.