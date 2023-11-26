# Awesome App ![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white) ![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white) <img src="https://github.com/willsgobi/awesome_app/assets/35748585/11d100bd-a642-439e-b3a8-e062b2b83e7a" alt="Logo app" height="40" style="margin-bottom: -5px;" />

Este projeto tem como principal objetivo salvar informações importantes do seu dia a dia, você pode criar, editar e excluir suas informações a qualquer momento!

> - ## Pacotes utilizados no projeto
>
>   - [MobX](https://pub.dev/packages/mobx) _([Flutter MobX](https://pub.dev/>packages/flutter_mobx), [MobX Codegen](https://pub.dev/packages/mobx_codegen), [Build Runner](https://pub.dev/packages/build_runner))_
>
>     - Utilizado para gerenciamento de estado da aplicação, geração do código automaticamente e Widgets do MobX.
>
>   - [Shared Preferences](https://pub.dev/packages/shared_preferences)
>     - Utilizado para armazenar localmente as informações inseridas pelo usuário
>   - [Url Launcher](https://pub.dev/packages/url_launcher)
>     - Utilizado para abrir um navegador externo

# Debug

Para debugar e atualizar informações no código deste app, você pode utilizar o VS Code, tento em mente que as extensões do Flutter e Dart estejam instaladas corretamente e que o Flutter esteja devidamente configurado em seu computador.

### Comandos úteis neste projeto

- Adicionar um pacote:

```
flutter pub add [package_name]
```

- Gerar automaticamente o código reativo do MobX:

```
dart run build_runner build --delete-conflicting-outputs
```

# Build

Você pode tanto rodar o projeto diretamente pelo modo debug do VS Code (F5) ou pelo terminal, com o comando `flutter run` especificando o dispositivo desejado

Também é possível gerar o APK para instalar em dispositivos reais, basta rodar o comando abaixo:
`flutter build apk --release`

**Nota:** Para instalar o apk em um dispositivo real é necessário que o dispositivo esteja previamente configurado para instalar apps fora da PlayStore.

> [Baixar o apk](https://drive.google.com/file/d/1h9m4c6E-nXgSTla6_5Or3H5t5XSAcXnd/view?usp=drive_link)

# Evoluções no projeto

Para melhorar ainda mais este app, no futuro os seguintes pontos podem ser melhorados:

- Criação de interface/abstract class para reduzir o acoplamento do pacotes, tais como o Shared Preferences e Url Launcher, em caso de uma troca futura, a implementação estará pronta
- Utilizar o Provider para injeção de dependências das implementações possíveis no tópico acima

# Screenshots do app

<img src="https://github.com/willsgobi/awesome_app/assets/35748585/469bda72-c4d8-4311-bac9-f081a5ffa995" alt="Tela de login" width="250"/>
<img src="https://github.com/willsgobi/awesome_app/assets/35748585/7131b1d9-13ab-4cf8-ad13-d91353d9d045" alt="Tela inicial" width="250"/>
<img src="https://github.com/willsgobi/awesome_app/assets/35748585/fb3bbeb9-c80b-4a32-ac39-3cf56f175612" alt="Deletar item" width="250"/>
<img src="https://github.com/willsgobi/awesome_app/assets/35748585/cee27793-cb5c-4e99-864b-3357bc39b9f8" alt="Atualizar item" width="250"/>

# Contribuir com o projeto

Sinta-se a vontade caso queira aprimorar o projeto!
