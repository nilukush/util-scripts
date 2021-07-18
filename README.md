Welcome to util-scripts. This is home to all the shell scripts that I use in my daily life to make my development and coding process way easier.

## [setup_env_local.zsh](https://github.com/nilukush/util-scripts/blob/master/setup_env_local.zsh)

One script in particular, which is [setup_env_local.zsh](https://github.com/nilukush/util-scripts/blob/master/setup_env_local.zsh) is quite important and useful because whenever I switch laptops, mainly when I am switching my companies, I need to re-setup everything and hence, I created this neat little script which takes care of setting up my local environment wherever I go. You should try it out if you like it. You just need to run the script to completely setup your local environment.

## [initialize_gradle_web_project.zsh](https://github.com/nilukush/util-scripts/blob/master/initialize_gradle_web_project.zsh)

There is one more, which is [initialize_gradle_web_project.zsh](https://github.com/nilukush/util-scripts/blob/master/initialize_gradle_web_project.zsh) . This is an easy-to-use script to initialize a Gradle Web Project where you can provide all the dependencies and other details that will help you initialize the project. By default, it includes the following dependencies in the project :

* Web
* MySQL
* RSocket
* Lombok

This is how you can use the following script :
```bash
initialize_gradle_web_project.zsh <comma separated list of dependencies> <application_name> <artifact_id> <group_id> <name> <package_name>
```

Here is an example execution of the script ya :
```bash
initialize_gradle_web_project.zsh liquibase MufoDatabaseApplication mufo_database com.mufo mufo_database com.mufo.mufo_database
```

This helps generate a complete basic structure for a Spring Boot based Gradle Web Project as can be seen in below image :
![Example Run of Initialializing Gradle Web Project](/images/example_run_of_initialize_gradle_web_project.png)

![Example Run of Initialializing Gradle Web Project 2](/images/example_run_of_initialize_gradle_web_project_2.png)

Do give it a try guys. Thanks for reading through. Cheers !
