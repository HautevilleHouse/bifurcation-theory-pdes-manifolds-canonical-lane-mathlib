import BifurcationTheoryPdesManifoldsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BifurcationWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse