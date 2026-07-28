import canonicalLaneMathlib.AdmissibleClass
import BifurcationTheoryPdesManifoldsCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  manifoldConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String

def sourceRepository : String :=
  "bifurcation-theory-pdes-manifolds-canonical-lane"

def sourceDescription : String :=
  "Bifurcation Theory on PDEs on Manifolds"

def sourceTheoremBoundary : String :=
  "Classical PDE bifurcation theory"

def baselineCertificateLane : String :=
  "manifold_constrained"

def sourceTheoremStatement : TheoremStatement :=
  {
    sourceKey := sourceRepository
  , theoremName := sourceRepository
  , theoremObject := sourceDescription
  , classicalBoundary := sourceTheoremBoundary
  , manifoldConstrainedStatement := "manifold-constrained theorem certificate internalized through bifurcation closure"
  , certificateLane := baselineCertificateLane
  , carriedRemainder := "classical source boundary carried by formalization"
  }

theorem theorem_statement_source_key_checked :
    sourceTheoremStatement.sourceKey = sourceRepository :=
  rfl

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse