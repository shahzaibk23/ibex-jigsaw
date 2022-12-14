ThisBuild / scalaVersion     := "2.13.8"
ThisBuild / version          := "0.1.0"
ThisBuild / organization     := "merledu"

val chiselVersion = "3.5.1"

lazy val caravan = (project in file("caravan"))

lazy val jigsaw = (project in file("jigsaw")).dependsOn(caravan)


lazy val root = (project in file("."))
  .settings(
    name := "ibex_jigsaw",
    libraryDependencies ++= Seq(
      "edu.berkeley.cs" %% "chisel3" % chiselVersion,
      "edu.berkeley.cs" %% "chiseltest" % "0.5.1" % "test"
    ),
    scalacOptions ++= Seq(
      "-language:reflectiveCalls",
      "-deprecation",
      "-feature",
      "-Xcheckinit",
      "-P:chiselplugin:genBundleElements",
    ),
    addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin" % chiselVersion cross CrossVersion.full),
  )
  .dependsOn(jigsaw, caravan)
