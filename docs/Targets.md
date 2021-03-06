# Available Targets:

| Target                                                                                           | Provider     | Target file                                                          | Remote Access? |
| -----------------------------------------------------------------------------------------        | ------------ | -----------------------------------------------------                | -------------- |
| [DVWA (Damn Vulnerable Web Application)](http://www.dvwa.co.uk/)                                 | virtualbox   | [dvwa](../targets/dvwa.rb)                                           | Yes            |
|                                                                                                  | docker       | [docker-dvwa](../targets/docker-dvwa.rb)                             | Yes            |
| [OWASP Vicnum](https://www.owasp.org/index.php/Category:OWASP_Vicnum_Project)                    | virtualbox   | [vicnum](../targets/vicnum.rb)                                       | Yes            |
| [Google Gruyere](http://google-gruyere.appspot.com/)                                             | virtualbox   | [gruyere](../targets/gruyere.rb)                                     | Yes            |
|                                                                                                  | docker       | [docker-gruyere](../targets/docker-gruyere.rb)                       | Yes            |
| [OWASP Bricks](https://www.owasp.org/index.php/OWASP_Bricks)                                     | virtualbox   | [bricks](../targets/bricks.rb)                                       | Yes            |
|                                                                                                  | docker       | [docker-bricks](../targets/docker-bricks.rb)                         | Yes            |
| [OWASP Webgoat](https://www.owasp.org/index.php/Category:OWASP_WebGoat_Project)                  | virtualbox   | [webgoat](../targets/webgoat.rb)                                     | Yes            |
|                                                                                                  | docker       | [docker-webgoat](../targets/docker-webgoat.rb)                       | Yes            |
|                                                                                                  | openstack    | [os-webgoat](../targets/os-webgoat.rb)                               | Yes            |
| [Metasploitable 2](http://sourceforge.net/projects/metasploitable/files/Metasploitable2/)        | virtualbox   | [metasploitable2](../targets/metasploitable2.rb)                     | Yes            |
| [Metasploitable 3 Windows 2008R2](https://github.com/rapid7/metasploitable3)                     | virtualbox   | [metasploitable3-win2008r2](../targets/metasploitable3-win2008r2.rb) | Yes            |
| [Metasploitable 3 Ubuntu trusty](https://github.com/rapid7/metasploitable3)                      | virtualbox   | [metasploitable3-trusty](../targets/metasploitable3-trusty.rb)       | Yes            |
| [OWASP Mutillidae](https://sourceforge.net/projects/mutillidae/files/mutillidae-project/)        | docker       | [docker-mutillidae](../targets/docker-mutillidae.rb)                 | Yes            |
| Docker Host with vulnerable containers                                                           | virtualbox   | [docker-host](../targets/docker-host.rb)                             | Yes            |
| [Vulnhub PRIMER: 1.0.1](https://www.vulnhub.com/entry/primer-101,136/)                           | virtualbox   | [primer](../targets/primer.rb)                                       | Yes            |
| [Vulnhub Csharp VulnJson](https://www.vulnhub.com/entry/csharp-vulnjson,134/)                    | virtualbox   | [csharp-vuln-json](../targets/csharp-vuln-json.rb)                   | No             |
| [Vulnhub Csharp VulnSoap](https://www.vulnhub.com/entry/csharp-vulnsoap,135/)                    | virtualbox   | [csharp-vuln-soap](../targets/csharp-vuln-soap.rb)                   | No             |
| [Vulnhub DC416 Baffle](https://www.vulnhub.com/entry/dc416-2016,168/)                            | virtualbox   | [dc416-baffle](../targets/dc416-baffle.rb)                           | No             |
| [Vulnhub DC416 Basement](https://www.vulnhub.com/entry/dc416-2016,168/)                          | virtualbox   | [dc416-basement](../targets/dc416-basement.rb)                       | No             |
| [Vulnhub DC416 Dick Dastardly](https://www.vulnhub.com/entry/dc416-2016,168/)                    | virtualbox   | [dc416-dick-dastardly](../targets/dc416-dick-dastardly.rb)           | No             |
| [Vulnhub Defence Space CTF](https://www.vulnhub.com/entry/defence-space-ctf-2017,179/)           | virtualbox   | [defence-space-ctf](../targets/defence-space-ctf.rb)                 | No             |
| [Vulnhub FartKnocker](https://www.vulnhub.com/entry/tophatsec-fartknocker,115/)                  | virtualbox   | [fart-knocker](../targets/fart-knocker.rb)                           | No             |
| [Vulnhub Gibson](https://www.vulnhub.com/entry/gibson-02,146/)                                   | virtualbox   | [gibson](../targets/gibson.rb)                                       | No             |
| [Vulnhub Hackday Albania](https://www.vulnhub.com/entry/hackday-albania,167/)                    | virtualbox   | [hackday-albania](../targets/hackday-albania.rb)                     | No             |
| [Vulnhub Hackfest 2016 Orcus](https://www.vulnhub.com/entry/hackfest2016-orcus,182/)             | virtualbox   | [hackfest2016-orcus](../targets/hackfest2016-orcus.rb)               | No             |
| [Vulnhub Hackfest 2016 Quaoar](https://www.vulnhub.com/entry/hackfest2016-quaoar,180/)           | virtualbox   | [hackfest2016-quaoar](../targets/hackfest2016-quaoar.rb)             | No             |
| [Vulnhub Hackfest 2016 Sedna](https://www.vulnhub.com/entry/hackfest2016-sedna,181/)             | virtualbox   | [hackfest2016-sedna](../targets/hackfest2016-sedna.rb)               | No             |
| [Vulnhub Hell](https://www.vulnhub.com/entry/hell-1,95/)                                         | virtualbox   | [hell](../targets/hell.rb)                                           | No             |
| [Vulnhub IMF](https://www.vulnhub.com/entry/imf-1,162/)                                          | virtualbox   | [IMF](../targets/IMF.rb)                                             | No             |
| [Vulnhub Kevgir](https://www.vulnhub.com/entry/kevgir-1,137/)                                    | virtualbox   | [kevgir](../targets/kevgir.rb)                                       | No             |
| [Vulnhub MrRobot](https://www.vulnhub.com/entry/mr-robot-1,151/)                                 | virtualbox   | [mrrobot](../targets/mrrobot.rb)                                     | No             |
| [Vulnhub Owlnest](https://www.vulnhub.com/entry/owlnest-102,102/)                                | virtualbox   | [owlnest](../targets/owlnest.rb)                                     | No             |
| [Vulnhub Pipe](https://www.vulnhub.com/entry/devrandom-pipe,124/)                                | virtualbox   | [pipe](../targets/pipe.rb)                                           | No             |
| [Vulnhub Pwnlab Init](https://www.vulnhub.com/entry/pwnlab-init,158/)                            | virtualbox   | [pwnlab-init](../targets/pwnlab-init.rb)                             | No             |
| [Vulnhub ROP Primer](https://www.vulnhub.com/entry/rop-primer-02,114/)                           | virtualbox   | [rop-primer](../targets/rop-primer.rb)                               | No             |
| [Vulnhub Sidney](https://www.vulnhub.com/entry/sidney-02,149/)                                   | virtualbox   | [sidney](../targets/sidney.rb)                                       | No             |
| [Vulnhub Skydogcon CTF 2016](https://www.vulnhub.com/entry/skydog-2016-catch-me-if-you-can,166/) | virtualbox   | [skydogcon-ctf-2016](../targets/skydogcon-ctf-2016.rb)               | No             |
| [Vulnhub BNE0x03 - Simple](https://www.vulnhub.com/entry/sectalks-bne0x03-simple,141/)           | virtualbox   | [simple](../targets/simple.rb)                                       | No             |
| [Vulnhub SkyDog CTF](https://www.vulnhub.com/entry/skydog-1,142/)                                | virtualbox   | [skydog-ctf](../targets/skydog-ctf.rb)                               | No             |
| [Vulnhub Teuchter](https://www.vulnhub.com/entry/teuchter-03,163/)                               | virtualbox   | [teuchter](../targets/teuchter.rb)                                   | No             |
| [Vulnhub Tommy Boy](https://www.vulnhub.com/entry/tommy-boy-1,157/)                              | virtualbox   | [tommy-boy](../targets/tommy-boy.rb)                                 | No             |
| [Vulnhub The Net](https://www.vulnhub.com)                                                       | virtualbox   | [the-net](../targets/the-net.rb)                                     | No             |
| [Vulnhub Violator](https://www.vulnhub.com/entry/violator-1,153/)                                | virtualbox   | [violator](../targets/violator.rb)                                   | No             |
| [Vulnhub Web Security Dojo](https://www.vulnhub.com/entry/web-security-dojo-2,65/)               | virtualbox   | [web-sec-dojo](../targets/web-sec-dojo.rb)                           | No             |
| [Vulnhub Zorz](https://www.vulnhub.com/entry/tophatsec-zorz,117/)                                | virtualbox   | [zorz](../targets/zorz.rb)                                           | No             |
| Windown XP IE6                                                                                   | virtualbox   | [winxpie6](../targets/winxpie6.rb)                                   | ???            |
| Windows XP IE8                                                                                   | virtualbox   | [winxpie8](../targets/winxpie8.rb)                                   | ???            |
| Windows Vista IE7                                                                                | virtualbox   | [vistaie7](../targets/vistaie7.rb)                                   | ???            |
| Windows 7 IE8                                                                                    | virtualbox   | [win7ie8](../targets/win7ie8.rb)                                     | ???            |
| Windows 7 IE9                                                                                    | virtualbox   | [win7ie9](../targets/win7ie9.rb)                                     | ???            |
| Windows 8 IE10                                                                                   | virtualbox   | [win8ie10](../targets/win8ie10.rb)                                   | ???            |
| Windows 8.1 IE11                                                                                 | virtualbox   | [win81ie11](../targets/win81ie11.rb)                                 | ???            |
| Windows 2008 Entreprise                                                                          | virtualbox   | [win2008ent](../targets/win2008ent.rb)                               | ???            |
| Windows 2008 Web                                                                                 | virtualbox   | [win2008web](../targets/win2008web.rb)                               | ???            |
| Windows 2012 Standard                                                                            | virtualbox   | [win2012std](../targets/win2012std.rb)                               | ???            |
| Windows 2012 Datacenter                                                                          | virtualbox   | [win2012dc](../targets/win2012dc.rb)                                 | ???            |
