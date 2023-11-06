Select *
From Portfolio..CovidDeaths
Where Continent is not null
Order by 3,4

Select *
From Portfolio..CovidVaccinations
Order by 3,4

Select Location, date, total_cases, new_cases, total_deaths, Population
From Portfolio..CovidDeaths
Order by 1,2

Select Location, date, total_deaths, total_cases , (CONVERT(float, total_deaths) / NULLIF(CONVERT(float, total_cases), 0))*100 as DeathPercentage
From Portfolio..CovidDeaths
Where Location like '%states%'
Order by 1,2

Select Location, date, total_cases, Population , (CONVERT(float, total_cases) / NULLIF(CONVERT(float, Population), 0))*100 as PercentagePopulationInfected
From Portfolio..CovidDeaths
Where Location like '%states%'
Order by 1,2

Select Location, Population , MAX(total_cases) as HighestInfectionCount, MAX( (CONVERT(float, total_cases) / NULLIF(CONVERT(float, Population), 0))*100) as PercentPopulationInfected
From Portfolio..CovidDeaths
Group by Population, Location
Order by PercentPopulationInfected desc

Select Location,  MAX(cast (total_deaths as int)) as TotalDeathCount
From Portfolio..CovidDeaths
Where Continent is not null
Group by Location
Order by TotalDeathCount desc

Select continent,  MAX(cast (total_deaths as int)) as TotalDeathCount
From Portfolio..CovidDeaths
Where Continent is not null
Group by continent
Order by TotalDeathCount desc

Select  SUM(new_cases) AS total_cases , SUM(Cast(new_deaths AS int)) as total_deaths, SUM(Cast(new_deaths AS int)) / SUM(new_cases)*100 as DeathPercentage
From Portfolio..CovidDeaths
Where Continent is not null
Order by 1,2


Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(Cast(vac.new_vaccinations AS int)) OVER (Partition by dea.location Order by dea.location, dea.date) AS RollingPeopleVaccinated 
From Portfolio..CovidDeaths dea
Join Portfolio..CovidVaccinations vac
On dea.location = vac.location
and dea.date = vac.date
Where dea.continent is not null
Order by 2,3

--Use CTE
With PoPvsVac (Continent, Location, date, Population ,new_vaccinations,RollingPeopleVaccinated)
as 
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(Cast(vac.new_vaccinations AS int)) OVER (Partition by dea.location Order by dea.location, dea.date) AS RollingPeopleVaccinated  
From Portfolio..CovidDeaths dea
Join Portfolio..CovidVaccinations vac
On dea.location = vac.location
and dea.date = vac.date
Where dea.continent is not null
--Order by 2,3
)
Select *, (RollingPeopleVaccinated/Population)*100 From PoPvsVac 



--Temp Table
Drop Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated 
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)
Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(Convert(int,vac.new_vaccinations)) OVER (Partition by dea.location Order by dea.location, dea.date) as RollingPeopleVaccinated  
From Portfolio..CovidDeaths dea
Join Portfolio..CovidVaccinations vac
On dea.location = vac.location
and dea.date = vac.date
Where dea.continent is not null
--Order by 2,3
Select * , (RollingPeopleVaccinated/Population)*100 
From #PercentPopulationVaccinated

--Creating View to store data for later Visualization

CreateView PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(Convert(int,vac.new_vaccinations)) OVER (Partition by dea.location Order by dea.location, dea.date) as RollingPeopleVaccinated  
From Portfolio..CovidDeaths dea
Join Portfolio..CovidVaccinations vac
On dea.location = vac.location
and dea.date = vac.date
Where dea.continent is not null
--Order by 2,3
Select * 
From #PercentPopulationVaccinated

 

