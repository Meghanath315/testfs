pipeline
{
    agent any
    parameters
    {
        choice (name:'meghanath', choices: 'dev\nqa', description:'deploy')
    }
//    tools
//    {
//        maven:'maven3'
//    }
    stages
    {
        stage ('git checkout')
        {
            steps
            {
                git credentialsId: 'git-crd', url: 'https://github.com/Meghanath315/testfs.git'
            }
        }
     // stage ('maven build')
     //   {
     //       steps
     //     {
     //         sh 'mvn clean package'
     //     }
     // }
        stage ('docker build')
        {
            steps
            {
                withDockerRegistry(credentialsId: 'docker-cred', url: 'https://index.docker.io/v1/')
                {
                    sh 'docker build -t meghanath315/anji1:1 -f Dockerfile .'
                    sh 'docker push meghanath315/anji1:1'
                    
                }
            }
        }
        stage ('deploy in dev')
        {
            steps
            {
                script
                {
                    if("${params.meghanath}" =='dev')
                    {
                        ansiblePlaybook credentialsId: 'ans-crd', installation: 'ansible', inventory: '/etc/ansible/hosts', playbook: '/var/lib/jenkins/workspace/meg/ansible.yml', skippedTags: 'qa', tags: 'dev'
                    }
                }
            }
        }
        stage ('deploy in qa')
        {
            steps
            {
                script
                {
                    if("${params.meghanath}" =='qa')
                    {
                        ansiblePlaybook credentialsId: 'ans-crd', installation: 'ansible', inventory: '/etc/ansible/hosts', playbook: '/var/lib/jenkins/workspace/meg/ansible.yml', skippedTags: 'dev', tags: 'qa'
                    }
                }
            }
        }
     
    }
}
