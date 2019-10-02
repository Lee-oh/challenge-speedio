# challenge-speedio
Sinatra-RabbitMQ

1 - Para execututar a API basta entrar na pasta executar o bundle install e logo após rackup para rodar o servidor.

2 - Entre na pasta DECODE execute no terminal o Script listem_rabbit.rb, este scrip fica escuando um canal do proquer com o tópico "message".

3 - Com o Postman manade um post para a rota send_tasks_rabbit com este JSON( {
    "user_id" : "5b60532fa153c976cb8271d8",
    "uri" : "https://app.speedio.com.br",
    "access_time" : "ISODate(2018-11-26T12:08:08.434TZ)",
    "request_method" : "POST",
    "user_agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36"
}).


4 - Verifique na janela do terminal o script listem_rabbit.rb...verifique se o JSON foi consumido e se mostra a msg "Success!".


5 - Abra no navegador em localhost:9292/task, logo verá o JSON cadastrado.


6 - Entre na pasta DECODE execute no terminal o Script output.rb, apererá ua lista do banco com os JSON cadastrados.
