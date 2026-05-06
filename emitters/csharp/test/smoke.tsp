import "@ancplua/typespec-emit-csharp";

using ANcpLua.OtelConventions.Emit.CSharp;

@csharpNamespace("ANcpLua.OtelConventions.Test")
namespace ANcpLua.OtelConventions.Test;

@csharpRecord
model Point {
  x: int32;
  y: int32;
  label?: string;
}

@csharpEnum
enum Color {
  Red,
  Green,
  Blue,
}
