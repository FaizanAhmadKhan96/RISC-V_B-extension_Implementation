### java.lang.IndexOutOfBoundsException: -1 is out of bounds (min 0, max 2)

occurred in the presentation compiler.

presentation compiler configuration:
Scala version: 2.13.8
Classpath:
<WORKSPACE>/.bloop/root/bloop-bsp-clients-classes/classes-Metals-uYWx49-GT1-Ju_DEH82TsQ== [exists ], /m/home/home9/97/khanf4/unix/.cache/bloop/semanticdb/com.sourcegraph.semanticdb-javac.0.10.0/semanticdb-javac-0.10.0.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/scala-library/2.13.8/scala-library-2.13.8.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/edu/berkeley/cs/chisel3_2.13/3.5.4/chisel3_2.13-3.5.4.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/edu/berkeley/cs/chisel3-macros_2.13/3.5.4/chisel3-macros_2.13-3.5.4.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/edu/berkeley/cs/chisel3-core_2.13/3.5.4/chisel3-core_2.13-3.5.4.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/scala-reflect/2.13.8/scala-reflect-2.13.8.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/com/lihaoyi/os-lib_2.13/0.8.0/os-lib_2.13-0.8.0.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/edu/berkeley/cs/firrtl_2.13/1.5.4/firrtl_2.13-1.5.4.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/com/lihaoyi/geny_2.13/0.7.0/geny_2.13-0.7.0.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/org/antlr/antlr4-runtime/4.9.3/antlr4-runtime-4.9.3.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/com/google/protobuf/protobuf-java/3.18.0/protobuf-java-3.18.0.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/com/github/scopt/scopt_2.13/3.7.1/scopt_2.13-3.7.1.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/net/jcazevedo/moultingyaml_2.13/0.4.2/moultingyaml_2.13-0.4.2.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/org/json4s/json4s-native_2.13/3.6.12/json4s-native_2.13-3.6.12.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/org/apache/commons/commons-text/1.9/commons-text-1.9.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/io/github/alexarchambault/data-class_2.13/0.2.5/data-class_2.13-0.2.5.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/org/scala-lang/modules/scala-parallel-collections_2.13/1.0.4/scala-parallel-collections_2.13-1.0.4.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/com/github/nscala-time/nscala-time_2.13/2.22.0/nscala-time_2.13-2.22.0.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/org/yaml/snakeyaml/1.26/snakeyaml-1.26.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/org/json4s/json4s-core_2.13/3.6.12/json4s-core_2.13-3.6.12.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/org/apache/commons/commons-lang3/3.11/commons-lang3-3.11.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/joda-time/joda-time/2.10.1/joda-time-2.10.1.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/org/joda/joda-convert/2.2.0/joda-convert-2.2.0.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/org/json4s/json4s-ast_2.13/3.6.12/json4s-ast_2.13-3.6.12.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/org/json4s/json4s-scalap_2.13/3.6.12/json4s-scalap_2.13-3.6.12.jar [exists ], /m/home/home9/97/khanf4/unix/.cache/coursier/v1/https/repo1.maven.org/maven2/com/thoughtworks/paranamer/paranamer/2.8/paranamer-2.8.jar [exists ]
Options:
-language:reflectiveCalls -deprecation -feature -Xcheckinit -Yrangepos -Xplugin-require:semanticdb


action parameters:
<NONE>


#### Error stacktrace:

```
scala.collection.mutable.ArrayBuffer.apply(ArrayBuffer.scala:98)
	scala.reflect.internal.Types$Type.findMemberInternal$1(Types.scala:1030)
	scala.reflect.internal.Types$Type.findMember(Types.scala:1035)
	scala.reflect.internal.Types$Type.memberBasedOnName(Types.scala:661)
	scala.reflect.internal.Types$Type.nonPrivateMember(Types.scala:632)
	scala.reflect.internal.Types.specializesSym(Types.scala:4785)
	scala.reflect.internal.Types.specializesSym$(Types.scala:4771)
	scala.reflect.internal.SymbolTable.specializesSym(SymbolTable.scala:28)
	scala.reflect.internal.Types.addMember(Types.scala:5161)
	scala.reflect.internal.Types.addMember$(Types.scala:5158)
	scala.reflect.internal.SymbolTable.addMember(SymbolTable.scala:28)
	scala.reflect.internal.Types.addMember(Types.scala:5153)
	scala.reflect.internal.Types.addMember$(Types.scala:5153)
	scala.reflect.internal.SymbolTable.addMember(SymbolTable.scala:28)
	scala.reflect.internal.Symbols$Symbol.$anonfun$classBound$2(Symbols.scala:1843)
	scala.reflect.internal.Symbols$Symbol.classBound(Symbols.scala:1842)
	scala.reflect.internal.Types.elimAnonymousClass(Types.scala:4984)
	scala.reflect.internal.Types.elimAnonymousClass$(Types.scala:4982)
	scala.reflect.internal.SymbolTable.elimAnonymousClass(SymbolTable.scala:28)
	scala.tools.nsc.typechecker.Infer$Inferencer.$anonfun$inferMethodInstance$1(Infer.scala:1087)
	scala.tools.nsc.typechecker.Infer$Inferencer.inferMethodInstance(Infer.scala:1087)
	scala.tools.nsc.typechecker.Typers$Typer.handlePolymorphicCall$1(Typers.scala:3841)
	scala.tools.nsc.typechecker.Typers$Typer.doTypedApply(Typers.scala:3846)
	scala.tools.nsc.typechecker.Typers$Typer.normalTypedApply$1(Typers.scala:5095)
	scala.tools.nsc.typechecker.Typers$Typer.typedApply$1(Typers.scala:5104)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:5985)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6041)
	scala.tools.nsc.typechecker.Typers$Typer.computeType(Typers.scala:6130)
	scala.tools.nsc.typechecker.Namers$Namer.assignTypeToTree(Namers.scala:1127)
	scala.tools.nsc.typechecker.Namers$Namer.valDefSig(Namers.scala:1745)
	scala.tools.nsc.typechecker.Namers$Namer.memberSig(Namers.scala:1930)
	scala.tools.nsc.typechecker.Namers$Namer.typeSig(Namers.scala:1880)
	scala.tools.nsc.typechecker.Namers$Namer$ValTypeCompleter.completeImpl(Namers.scala:944)
	scala.tools.nsc.typechecker.Namers$Namer$AccessorTypeCompleter.completeImpl(Namers.scala:968)
	scala.tools.nsc.typechecker.Namers$LockingTypeCompleter.complete(Namers.scala:2078)
	scala.tools.nsc.typechecker.Namers$LockingTypeCompleter.complete$(Namers.scala:2076)
	scala.tools.nsc.typechecker.Namers$TypeCompleterBase.complete(Namers.scala:2071)
	scala.reflect.internal.Symbols$Symbol.completeInfo(Symbols.scala:1561)
	scala.reflect.internal.Symbols$Symbol.info(Symbols.scala:1533)
	scala.reflect.internal.Symbols$Symbol.cookJavaRawInfo(Symbols.scala:1749)
	scala.tools.nsc.typechecker.Infer$Inferencer.checkAccessible(Infer.scala:302)
	scala.tools.nsc.typechecker.Typers$Typer.makeAccessible(Typers.scala:577)
	scala.tools.nsc.typechecker.Typers$Typer.typedIdent$2(Typers.scala:5499)
	scala.tools.nsc.typechecker.Typers$Typer.typedIdentOrWildcard$1(Typers.scala:5522)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:5983)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6041)
	scala.tools.nsc.typechecker.Typers$Typer.typedSelectOrSuperCall$1(Typers.scala:6139)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:5986)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6041)
	scala.tools.nsc.typechecker.Typers$Typer.computeType(Typers.scala:6130)
	scala.tools.nsc.typechecker.Namers$Namer.assignTypeToTree(Namers.scala:1127)
	scala.tools.nsc.typechecker.Namers$Namer.valDefSig(Namers.scala:1745)
	scala.tools.nsc.typechecker.Namers$Namer.memberSig(Namers.scala:1930)
	scala.tools.nsc.typechecker.Namers$Namer.typeSig(Namers.scala:1880)
	scala.tools.nsc.typechecker.Namers$Namer$ValTypeCompleter.completeImpl(Namers.scala:944)
	scala.tools.nsc.typechecker.Namers$Namer$AccessorTypeCompleter.completeImpl(Namers.scala:968)
	scala.tools.nsc.typechecker.Namers$LockingTypeCompleter.complete(Namers.scala:2078)
	scala.tools.nsc.typechecker.Namers$LockingTypeCompleter.complete$(Namers.scala:2076)
	scala.tools.nsc.typechecker.Namers$TypeCompleterBase.complete(Namers.scala:2071)
	scala.reflect.internal.Symbols$Symbol.completeInfo(Symbols.scala:1561)
	scala.reflect.internal.Symbols$Symbol.info(Symbols.scala:1533)
	scala.meta.internal.pc.CompletionItemResolver.fullDocstring(CompletionItemResolver.scala:66)
	scala.meta.internal.pc.CompletionItemResolver.$anonfun$handleSymbol$2(CompletionItemResolver.scala:39)
	scala.meta.internal.pc.ItemResolver.enrichDocs(ItemResolver.scala:75)
	scala.meta.internal.pc.ItemResolver.enrichDocs$(ItemResolver.scala:14)
	scala.meta.internal.pc.CompletionItemResolver.enrichDocs(CompletionItemResolver.scala:8)
	scala.meta.internal.pc.CompletionItemResolver.handleSymbol(CompletionItemResolver.scala:40)
	scala.meta.internal.pc.CompletionItemResolver.resolve(CompletionItemResolver.scala:24)
	scala.meta.internal.pc.ScalaPresentationCompiler.$anonfun$completionItemResolve$1(ScalaPresentationCompiler.scala:320)
```
#### Short summary: 

java.lang.IndexOutOfBoundsException: -1 is out of bounds (min 0, max 2)